package service

import (
	"fmt"
	"github.com/amplify-cms/sys-share/sys-core/service/fileutils"
	"gopkg.in/yaml.v2"
	"os"
)

const (
	errParsingConfig = "error parsing %s config: %v\n"
)

type BootstrapConfig struct {
	SavePath string `yaml:"savePath" json:"savePath"`
	Domain   string `yaml:"domain" json:"domain"`
}

func (c BootstrapConfig) Validate() error {
	if c.SavePath == "" {
		return fmt.Errorf(errParsingConfig, "bootstrap", "savepath is empty")
	}
	if ex, _ := fileutils.PathExists(c.SavePath); !ex {
		_ = os.MkdirAll(c.SavePath, 0755)
	}
	if c.Domain == "" {
		return fmt.Errorf(errParsingConfig, "bootstrap", "domain is empty")
	}
	return nil
}

// NewConfig creates BootstrapConfig from a yaml file
func NewConfig(filepath string) (*BootstrapConfig, error) {
	cfg := &BootstrapConfig{}
	f, err := fileutils.LoadFile(filepath)
	if err != nil {
		return nil, err
	}
	if err := yaml.UnmarshalStrict(f, &cfg); err != nil {
		return nil, fmt.Errorf(errParsingConfig, filepath, err)
	}
	if err := cfg.Validate(); err != nil {
		return nil, err
	}
	return cfg, nil
}
