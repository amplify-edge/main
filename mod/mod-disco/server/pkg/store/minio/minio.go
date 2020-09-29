package minio

import (
	"context"
	"errors"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"github.com/getcouragenow/modules/mod-disco/server/pkg/config"
	mn "github.com/minio/minio-go/v6"
	"github.com/minio/minio-go/v6/pkg/encrypt"
	"github.com/minio/minio-go/v6/pkg/s3utils"
)

type (
	Ministore struct {
		*mstore
	}
	mstore struct {
		bucket string
		mc     *mn.Client
		sse    encrypt.ServerSide
	}
	Valider interface {
		getParams() string
		getQuery() string
		validateParam() bool
	}
	listQuery struct {
		query string
	}
	singleQuery struct {
		query       string
		param       string
		regexString string
	}
)

func NewListQuery(query string) *listQuery {
	return &listQuery{
		query,
	}
}

func NewSingleQuery(query, param, regexString string) *singleQuery {
	return &singleQuery{
		query,
		param,
		regexString,
	}
}

func (s *singleQuery) getParams() string {
	return s.param
}

func (s *singleQuery) getQuery() string {
	return s.query
}

func (s *singleQuery) validateParam() bool {
	re := regexp.MustCompile(s.regexString)
	return re.MatchString(s.param)
}

func (l *listQuery) getParams() string {
	return ""
}

func (l *listQuery) getQuery() string {
	return l.query
}

func (l *listQuery) validateParam() bool {
	return true
}

// mstore contains minio bucket and client

func validateQuery(param, regex string) bool {
	re := regexp.MustCompile(regex)
	return re.MatchString(param)
}

// New creates new instance of mstore
func New(ctx context.Context, cfg config.ConnCfg) (*Ministore, error) {
	if err := s3utils.CheckValidBucketName(cfg.BucketName); err != nil {
		return nil, err
	}
	mc, err := mn.New(cfg.Endpoint, cfg.AccessKey, cfg.SecretKey, cfg.UseSSL)
	if err != nil {
		return nil, err
	}
	exists, err := mc.BucketExists(cfg.BucketName)
	if err != nil {
		return nil, err
	}
	if !exists {
		err = mc.MakeBucketWithContext(ctx, cfg.BucketName, cfg.Location)
		if err != nil {
			return nil, err
		}
	}
	var sse encrypt.ServerSide
	if len(cfg.EncKey) > 0 {
		sse, err = encrypt.NewSSEC(cfg.EncKey)
		if err != nil {
			return nil, err
		}
	}
	return &Ministore{
		&mstore{
			bucket: cfg.BucketName,
			mc:     mc,
			sse:    sse,
		},
	}, nil
}

func (m *Ministore) Migrate(ctx context.Context, datapath string) error {
	filenames, err := getCsvFilenames(datapath)
	if err != nil {
		return err
	}
	for _, v := range filenames {

		file, err := os.OpenFile(datapath+"/"+v, os.O_RDONLY, 0644)
		if err != nil {
			return err
		}
		_, err = m.Put(ctx, v, file)
		if err != nil {
			return err
		}
	}

	return nil
}

func (m *Ministore) MigrateImages(ctx context.Context, datapath string) error {
	filenames, err := getImagesFilenames(datapath)
	if err != nil {
		return err
	}
	for _, v := range filenames {

		file, err := os.OpenFile(v, os.O_RDONLY, 0644)
		if err != nil {
			return err
		}

		f := strings.Split(v, "/")
		name := "images/" + f[len(f)-2] + "/" + f[len(f)-1]

		_, err = m.Put(ctx, name, file)
		if err != nil {
			return err
		}
	}

	return nil
}

func getImagesFilenames(datapath string) ([]string, error) {
	var matches []string
	err := filepath.Walk(datapath, func(imagepath string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if info.IsDir() {
			return nil
		}

		file := strings.Split(info.Name(), ".")
		ext := file[len(file)-1]

		if ext == "png" || ext == "jpg" {
			matches = append(matches, imagepath)
		}
		return nil
	})
	if err != nil {
		return nil, err
	}
	return matches, nil
}

func getCsvFilenames(datapath string) ([]string, error) {
	var matches []string
	err := filepath.Walk(datapath, func(csvpath string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		// json dir inside csv output, just abandon it
		if info.IsDir() {
			return nil
		}
		if matched, err := filepath.Match("*.csv", filepath.Base(csvpath)); err != nil {
			return err
		} else if matched {
			matches = append(matches, info.Name())
		}
		return nil
	})
	if err != nil {
		return nil, err
	}
	return matches, nil
}

// Put will 'put' the object under the name to minio store
// since the object name is prefixed by the ID of both its campaign and support-role
// it should be easily queried.
func (m *Ministore) Put(ctx context.Context, name string, obj io.Reader) (int64, error) {
	return m.mc.PutObjectWithContext(ctx, m.bucket, name, obj, -1, mn.PutObjectOptions{
		ServerSideEncryption: m.sse,
	})
}

func (m *Ministore) Remove(name string) error {
	return m.mc.RemoveObject(m.bucket, name)
}

func (m *Ministore) Open(ctx context.Context, name string) (io.ReadSeeker, error) {
	return m.mc.GetObjectWithContext(ctx, m.bucket, name, mn.GetObjectOptions{
		ServerSideEncryption: m.sse,
	})
}

// TODO fix this implementation as this is an absolute perf hit.
func (m *Ministore) List(ctx context.Context, prefix string) ([]io.ReadSeeker, error) {
	var objContents []io.ReadSeeker
	var objNames []string
	doneChan := make(chan struct{})
	errChan := make(chan error)
	go func() {
		defer close(errChan)
		defer close(doneChan)
		for obj := range m.mc.ListObjectsV2(m.bucket, prefix, true, doneChan) {
			if obj.Err != nil {
				errChan <- obj.Err
			}
			objNames = append(objNames, obj.Key)
		}
	}()
	select {
	case <-doneChan:
		for _, name := range objNames {
			content, err := m.Open(ctx, name)
			if err != nil {
				return nil, err
			}
			objContents = append(objContents, content)
		}
	case err := <-errChan:
		return nil, err
	}

	return objContents, nil
}

func (m *Ministore) selectObject(ctx context.Context, query, objName string) ([]byte, error) {
	opts := mn.SelectObjectOptions{
		ServerSideEncryption: m.sse,
		Expression:           query,
		ExpressionType:       mn.QueryExpressionTypeSQL,
		InputSerialization: mn.SelectObjectInputSerialization{
			CompressionType: mn.SelectCompressionNONE,
			CSV: &mn.CSVInputOptions{
				FileHeaderInfo:  mn.CSVFileHeaderInfoUse,
				RecordDelimiter: "\n",
				FieldDelimiter:  ",",
			},
		},
		OutputSerialization: mn.SelectObjectOutputSerialization{
			JSON: &mn.JSONOutputOptions{
				RecordDelimiter: ",\n",
				// RecordDelimiter: "\r\n",
			},
		},
	}
	reader, err := m.mc.SelectObjectContent(ctx, m.bucket, objName, opts)
	if err != nil {
		return nil, err
	}
	defer reader.Close()
	return ioutil.ReadAll(reader)
}

func (m *Ministore) GetSingle(ctx context.Context, v Valider, objName string) ([]byte, error) {
	match := v.validateParam()
	if !match {
		return nil, errors.New("param(s) are not valid")
	}
	sq := v.getQuery() + v.getParams()
	byteres, err := m.selectObject(ctx, sq, objName)

	if err != nil {
		return nil, err
	}
	return byteres, nil
}

func (m *Ministore) GetMultiple(ctx context.Context, v Valider, objName string) ([]byte, error) {
	lq := v.getQuery()
	byteres, err := m.selectObject(ctx, lq, objName)

	if err != nil {
		return nil, err
	}
	return byteres, nil
}
