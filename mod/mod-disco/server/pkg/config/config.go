package config

import (
	"os"
	"reflect"
	"strconv"
	"time"
)

type configer interface {
	validate() error
}

type ModMainCfg struct {
	ConnOpt ConnCfg
}

// ConnCfg is the Connection Option for minio storage
type ConnCfg struct {
	AccessKey  string
	SecretKey  string
	EncKey     []byte
	Endpoint   string
	Location   string
	UseSSL     bool
	Timeout    time.Duration
	BucketName string
}

// NewCfgOptions creates new instance of ModMainCfg with options
func NewCfgOptions(configs map[string]string) (*ModMainCfg, error) {
	usesSSL := false
	if configs["MINIO_USE_SSL"] == "true" {
		usesSSL = true
	}

	c := &ModMainCfg{
		ConnCfg{
			AccessKey:  configs["MINIO_ACCESS_KEY"],
			SecretKey:  configs["MINIO_SECRET_KEY"],
			EncKey:     []byte(configs["MINIO_ENC_KEY"]),
			Endpoint:   configs["MINIO_ENDPOINT"],
			Location:   configs["MINIO_LOCATION"],
			UseSSL:     usesSSL,
			Timeout:    time.Millisecond * time.Duration(validateUintEnv(configs["MINIO_TIMEOUT"])),
			BucketName: configs["BUCKET_NAME"],
		},
	}
	err := c.validate()
	return c, err
}

// NewCfg creates new instance of ModMainCfg
func NewCfg() (*ModMainCfg, error) {
	usesSSL := false
	if os.Getenv("MINIO_USE_SSL") == "true" {
		usesSSL = true
	}
	c := &ModMainCfg{
		ConnCfg{
			AccessKey:  os.Getenv("MINIO_ACCESS_KEY"),
			SecretKey:  os.Getenv("MINIO_SECRET_KEY"),
			EncKey:     []byte(os.Getenv("MINIO_ENC_KEY")),
			Endpoint:   os.Getenv("MINIO_ENDPOINT"),
			Location:   os.Getenv("MINIO_LOCATION"),
			UseSSL:     usesSSL,
			Timeout:    time.Millisecond * time.Duration(validateUintEnv(os.Getenv("MINIO_TIMEOUT"))),
			BucketName: os.Getenv("BUCKET_NAME"),
		},
	}
	err := c.validate()
	return c, err
}

func (m *ModMainCfg) validate() error {
	v := reflect.ValueOf(m).Elem()
	baseConfigType := reflect.TypeOf((*configer)(nil)).Elem()

	for i := 0; i < v.NumField(); i++ {
		if v.Type().Field(i).Type.Implements(baseConfigType) {
			if err := v.Field(i).Interface().(configer).validate(); err != nil {
				return err
			}
		}
	}
	return nil
}

func validateUintEnv(v string) uint32 {
	if v == "" {
		return 0
	}
	u, err := strconv.ParseUint(v, 10, 64)
	if err != nil {
		return 0
	}
	return uint32(u)
}
