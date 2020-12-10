package wrapper

import (
	"fmt"
	"github.com/spf13/cobra"

	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
)

const (
	defaultInfoJsonOutput = true
)

var (
	buildInfoJsonOutput = true
)

type BuildInformationManifest struct {
	Version     Version     `json:"version" yaml:"version"`
	Branch      string      `json:"branch" yaml:"branch"`
	User        string      `json:"user" yaml:"user"`
	Date        string      `json:"date" yaml:"date"`
	ToolVersion ToolVersion `json:"toolVersion" yaml:"toolVersion"`
}

func (b *BuildInformationManifest) String() string {
	return fmt.Sprintf("Versions: %s\n Git Branch: %s\n Build User: %s\n Build Date: %s\n Tool Version: %s\n",
		b.Version.String(), b.Branch, b.User, b.Date, b.ToolVersion.String())
}

// outputs json
func (b *BuildInformationManifest) Marshal() ([]byte, error) {
	return sharedConfig.MarshalPretty(*b)
}

// Unmarshal from i.e. json or yaml
func ManifestFromFile(b []byte) (*BuildInformationManifest, error) {
	var buildInfo BuildInformationManifest
	if err := sharedConfig.UnmarshalJson(b, &buildInfo); err != nil {
		return nil, err
	}
	return &buildInfo, nil
}

func (b *BuildInformationManifest) JsonString() string {
	jbytes, _ := b.Marshal()
	return string(jbytes)
}

type Version struct {
	Frontend string `json:"frontend" yaml:"frontend"` // flutter version
	Server   string `json:"backend" yaml:"backend"`   // golang server version
	Cli      string `json:"cli" yaml:"cli"`           // golang cli version
}

func (v *Version) String() string {
	return fmt.Sprintf("\n\tFrontend: %s\n Server: %s\n Cli: %s\n", v.Frontend, v.Server, v.Cli)
}

type ToolVersion struct {
	Golang  string `json:"golang" yaml:"golang"`
	Flutter string `json:"flutter" yaml:"flutter"`
}

func (tv *ToolVersion) String() string {
	return fmt.Sprintf("Golang: %s,\n Flutter: %s,\n", tv.Golang, tv.Flutter)
}

func (b *BuildInformationManifest) CobraCommand() *cobra.Command {
	buildInfoCmd := &cobra.Command{Use: "version"}
	buildInfoCmd.PersistentFlags().BoolVar(&buildInfoJsonOutput, "json", defaultInfoJsonOutput, "json output or string output")

	buildInfoCmd.RunE = func(cmd *cobra.Command, args []string) error {
		var pretty string
		if buildInfoJsonOutput {
			pretty = b.JsonString()
		} else {
			pretty = b.String()
		}
		fmt.Println(pretty)
		return nil
	}
	return buildInfoCmd
}
