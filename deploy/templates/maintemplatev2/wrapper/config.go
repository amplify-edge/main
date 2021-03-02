package wrapper

import (
	"fmt"
	bsService "go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go"
	discoService "go.amplifyedge.org/mod-v2/mod-disco/service/go"
	"go.amplifyedge.org/sys-share-v2/sys-core/service/fileutils"
	sysAccountService "go.amplifyedge.org/sys-v2/sys-account/service/go"
	"gopkg.in/yaml.v2"
)

const (
	errParsingConfig = "error parsing %s config: %v\n"
)

// ServerConfig contains all the config server needs
type ServerConfig struct {
	MainConfigServer MainServerConfig                   `yaml:"mainConfig"`
	BootstrapConfig  bsService.BootstrapConfig          `yaml:"bootstrapConfig"`
	ModDiscoConfig   discoService.ModDiscoConfig        `yaml:"modDiscoConfig"`
	SysAccountConfig sysAccountService.SysAccountConfig `yaml:"sysAccountConfig"`
}

func (s ServerConfig) Validate() (err error) {
	if err = s.MainConfigServer.validate(); err != nil {
		return err
	}
	if err = s.BootstrapConfig.Validate(); err != nil {
		return err
	}
	if err = s.ModDiscoConfig.Validate(); err != nil {
		return err
	}
	return s.SysAccountConfig.Validate()
}

// ClientConfig contains all the config client  needs
type ClientConfig struct {
	MainConfigClient MainClientConfig          `yaml:"mainConfig"`
	BootstrapConfig  bsService.BootstrapConfig `yaml:"bootstrapConfig"`
}

func (cc ClientConfig) Validate() (err error) {
	if err = cc.MainConfigClient.validate(); err != nil {
		return err
	}
	return cc.BootstrapConfig.Validate()
}

type MainServerConfig struct {
	Domain      string    `yaml:"domain" json:"domain"`
	HostAddress string    `yaml:"host" json:"host"`
	Port        int       `yaml:"port" json:"port"`
	IsLocal     bool      `yaml:"isLocal" json:"isLocal"`
	EmbedDir    string    `yaml:"embedDir" json:"embedDir"`
	TLS         TLSConfig `yaml:"tls" json:"tls"`
}

func (c MainServerConfig) validate() error {
	if c.Domain == "" {
		c.Domain = "https://127.0.0.1"
	}
	if c.HostAddress == "" {
		c.HostAddress = "127.0.0.1"
	}
	if c.Port == 0 {
		c.Port = 8080
	}
	return c.TLS.validate()
}

type MainClientConfig struct {
	IsLocal bool      `yaml:"isLocal" json:"isLocal"`
	Domain  string    `yaml:"domain" json:"domain"`
	Port    int       `yaml:"port" json:"port"`
	TLS     TLSConfig `yaml:"tls" json:"tls"`
}

func (c MainClientConfig) validate() error {
	if c.Domain == "" {
		c.Domain = "https://127.0.0.1"
	}
	if c.Port == 0 {
		c.Port = 8080
	}
	return c.TLS.validate()
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
		if !fileutils.FileExists(t.LocalCertPath) {
			return fmt.Errorf(errParsingConfig, "mainConfig", "local cert path does not exists "+t.LocalCertPath)
		}
		if !fileutils.FileExists(t.LocalCertKeyPath) {
			return fmt.Errorf(errParsingConfig, "mainConfig", "local cert key path does not exists "+t.LocalCertKeyPath)
		}
	}
	if t.Enable && t.RootCAPath == "" {
		return fmt.Errorf(errParsingConfig, "mainConfig", "root ca path does not exists "+t.RootCAPath)
	}
	if t.Enable && t.RootCAPath != "" {
		if !fileutils.FileExists(t.RootCAPath) {
			return fmt.Errorf(errParsingConfig, "mainConfig", "root ca path does not exists "+t.LocalCertKeyPath)
		}
	}
	return nil
}

func NewServerConfig(filepath string) (*ServerConfig, error) {
	cfg := &ServerConfig{}
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

func NewClientConfig(filepath string) (*ClientConfig, error) {
	cfg := &ClientConfig{}
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
