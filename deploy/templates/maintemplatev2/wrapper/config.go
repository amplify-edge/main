package wrapper

import (
	"fmt"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	"gopkg.in/yaml.v2"
)

const (
	errParsingConfig = "error parsing %s config: %v\n"
)

type MainConfig struct {
	MainConfig Config `yaml:"mainConfig" json:"mainConfig"`
}

func (m MainConfig) Validate() error {
	return m.MainConfig.validate()
}

type Config struct {
	Port     int       `yaml:"port" json:"port"`
	IsLocal  bool      `yaml:"isLocal" json:"isLocal"`
	EmbedDir string    `yaml:"embedDir" json:"embedDir"`
	TLS      TLSConfig `yaml:""`
}

func (c Config) validate() error {
	return nil
}

type TLSConfig struct {
	Enable           bool   `yaml:"enable" json:"enable"`
	IsLocal          bool   `yaml:"isLocal" json:"isLocal"`
	LocalCertPath    string `yaml:"localCertPath" json:"localCertPath"`
	LocalCertKeyPath string `yaml:"localCertKeyPath" json:"localCertKeyPath"`
	RootCAPath       string `yaml:"rootCaPath" json:"rootCAPath"`
}

func (t TLSConfig) validate() error {
	if t.IsLocal {
		if !sharedConfig.FileExists(t.LocalCertPath) {
			return fmt.Errorf(errParsingConfig, "local cert path does not exists "+t.LocalCertPath)
		}
		if !sharedConfig.FileExists(t.LocalCertKeyPath) {
			return fmt.Errorf(errParsingConfig, "local cert key path does not exists "+t.LocalCertKeyPath)
		}
	}
	if t.Enable && t.RootCAPath == "" {
		return fmt.Errorf(errParsingConfig, "root ca path does not exists "+t.RootCAPath)
	}
	if t.Enable && t.RootCAPath != "" {
		if !sharedConfig.FileExists(t.RootCAPath) {
			return fmt.Errorf(errParsingConfig, "root ca path does not exists "+t.LocalCertKeyPath)
		}
	}
	return nil
}

func NewConfig(filepath string) (*MainConfig, error) {
	cfg := &MainConfig{}
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
