package service

import (
	"fmt"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	"gopkg.in/yaml.v2"
)

const (
	errParsingConfig = "error parsing %s config: %v\n"
)

type BootstrapConfig struct {
	BSConfig Config `yaml:"bootstrapConfig" json:"bootstrapConfig"`
}

func (b BootstrapConfig) Validate() error {
	return b.BSConfig.validate()
}

type Config struct {
	SavePath string `yaml:"savePath" json:"savePath"`
	Domain   string `yaml:"domain" json:"domain"`
}

func (c Config) validate() error {
	if c.SavePath == "" {
		return fmt.Errorf(errParsingConfig, "savepath is empty")
	}
	if c.Domain == "" {
		return fmt.Errorf(errParsingConfig, "domain is empty")
	}
	return nil
}

func NewConfig(filepath string) (*BootstrapConfig, error) {
	cfg := &BootstrapConfig{}
	f, err := sharedConfig.LoadFile(filepath)
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
