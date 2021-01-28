package repo

import (
	"bytes"
	"context"
	"fmt"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"

	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/getcouragenow/main/deploy/bootstrapper/service/go/pkg/fakedata"
	bsrpc "github.com/getcouragenow/main/deploy/bootstrapper/service/go/rpc/v2"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
)

const (
	maxFileSize = 8 << 20 // max upload bootstrap 8MB
	chunkSize   = 1 << 20 // chunk to 1MB

	errUpload = "cannot upload bootstrap file: %s, reason: %v"
)

// GenBSFile takes an extension format (i.e. yaml/yml or json)
// then creates a bootstrap file based on it, will return an error
// if the aforementioned extension format is not supported.
// example: GenBSFile("yaml")
func (b *BootstrapRepo) GenBSFile(extension string) (string, error) {
	bsAll, err := fakedata.BootstrapFakeData(b.domain)
	if err != nil {
		return "", err
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), extension)
	joined := filepath.Join(b.savePath, filename)
	return b.sharedGenBS(bsAll, joined, extension)
}

func (b *BootstrapRepo) ExecuteBSCli(ctx context.Context, filename string) error {
	joined := filepath.Join(b.savePath, filename)
	bsAll, err := fakedata.BootstrapAllFromFilepath(joined)
	if err != nil {
		return err
	}
	return b.sharedExecutor(ctx, bsAll, filename)
}

func (b *BootstrapRepo) ExecuteBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*emptypb.Empty, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joinedPth := filepath.Join(b.savePath, in.GetFileId())
	bsAll, err := fakedata.BootstrapAllFromFilepath(joinedPth)
	if err != nil {
		return nil, err
	}
	err = b.sharedExecutor(ctx, bsAll, in.FileId)
	if err != nil {
		return nil, err
	}
	return &emptypb.Empty{}, nil
}

func (b *BootstrapRepo) GetBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*bsrpc.BS, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joinedPth := filepath.Join(b.savePath, in.GetFileId())
	bsAll, err := fakedata.BootstrapAllFromFilepath(joinedPth)
	if err != nil {
		return nil, err
	}
	finfo, err := os.Stat(joinedPth)
	if err != nil {
		return nil, err
	}
	isActive := b.checkActive(in.GetFileId())
	return &bsrpc.BS{
		FileId:    in.GetFileId(),
		CreatedAt: timestamppb.New(finfo.ModTime()),
		Content: &bsrpc.BSRequest{
			Orgs:     bsAll.GetOrgs(),
			Projects: bsAll.GetProjects(),
		},
		IsCurrentlyActive: isActive,
	}, nil
}

func (b *BootstrapRepo) NewBootstrap(stream bsrpc.BSService_NewBootstrapServer) error {
	in, err := stream.Recv()
	if err != nil {
		return status.Errorf(codes.InvalidArgument, errUpload, "", err)
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), in.GetFileExtension())
	joined := filepath.Join(b.savePath, filename)
	fileBuf := bytes.Buffer{}
	fileSize := 0
	for {
		in, err = stream.Recv()
		if err != nil {
			if err == io.EOF {
				break
			}
			return status.Errorf(codes.Unknown, "cannot receive stream chunk: %v", err)
		}
		chunk := in.GetBsRequest() // as chunk
		chunkSize := len(chunk)
		fileSize += chunkSize
		if fileSize > maxFileSize {
			return status.Error(codes.Aborted, "file size exceeds maximum file size, aborting")
		}
		_, err = fileBuf.Write(chunk)
		if err != nil {
			return status.Errorf(codes.Internal, "cannot write file data to buffer: %v", err)
		}
	}
	if err = ioutil.WriteFile(joined, fileBuf.Bytes(), 0644); err != nil {
		return err
	}
	resp := &bsrpc.NewBSResponse{FileId: filename}
	if err = stream.SendAndClose(resp); err != nil {
		return status.Errorf(codes.Internal, "cannot encode upload resp: %v", err)
	}
	return nil
}

func (b *BootstrapRepo) ListBootstrap(ctx context.Context, in *bsrpc.ListBSRequest) (*bsrpc.ListBSResponse, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: pagination
	dirContents, err := sharedConfig.ListFiles(b.savePath)
	var bses []*bsrpc.BS
	for _, f := range dirContents {
		if f.Name() != filepath.Base(b.activeFilePath) {
			isActive := b.checkActive(f.Name())
			bses = append(bses, &bsrpc.BS{
				FileId:            f.Name(),
				CreatedAt:         timestamppb.New(f.ModTime()),
				IsCurrentlyActive: isActive,
			})
		}
	}
	return &bsrpc.ListBSResponse{Bootstraps: bses}, nil
}

func (b *BootstrapRepo) DeleteBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*emptypb.Empty, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joined := filepath.Join(b.savePath, in.GetFileId())
	err = os.RemoveAll(joined)
	if err != nil {
		return nil, err
	}
	id := in.GetFileId()
	if b.checkActive(id) {
		return &emptypb.Empty{}, b.setIsActive("")
	}
	return &emptypb.Empty{}, nil
}

func (b *BootstrapRepo) setIsActive(id string) error {
	return ioutil.WriteFile(b.activeFilePath, []byte(id), 0660)
}

func (b *BootstrapRepo) checkActive(id string) bool {
	activeBs, err := ioutil.ReadFile(b.activeFilePath)
	if err != nil {
		b.logger.Error("unable to read " + b.activeFilePath)
		return false
	}
	return id == string(activeBs)
}
