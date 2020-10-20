package deb

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"maintemplate/packer/utils"
	"os"
	"path"
	"path/filepath"
	"strings"
)

// DebianPack struct
type DebianPack struct {
	version string
	Path    string            `json:"path"`
	DirName string            `json:"dir_name"`
	AppName string            `json:"app_name"`
	Ctl     Control           `json:"control"`
	Desk    Desktop           `json:"desktop"`
	App     map[string]string `json:"app"`
	CMD     map[string]string `json:"cmd"`
}

// FromJSON generate deb package from json
func FromJSON(version, configFilePath string) (*DebianPack, error) {
	data, err := ioutil.ReadFile(configFilePath)
	if err != nil {
		return nil, err
	}
	deb := &DebianPack{}

	err = json.Unmarshal(data, &deb)
	if err != nil {
		return nil, err
	}
	deb.version = version
	return deb, nil
}

func (p *DebianPack) init() error {
	err := os.MkdirAll(p.getPath()+"/DEBIAN", 0755)
	if err != nil {
		return err
	}

	err = os.MkdirAll(p.getPath()+"/usr/bin", 0755)
	if err != nil {
		return err
	}

	err = os.MkdirAll(p.getPath()+"/usr/lib/"+p.AppName, 0755)
	if err != nil {
		return err
	}

	err = os.MkdirAll(p.getPath()+"/usr/share/applications", 0755)
	if err != nil {
		return err
	}

	err = utils.WriteFile(path.Join(p.getPath(), "usr/bin", p.AppName), p.entrypoint())
	if err != nil {
		return err
	}

	err = utils.WriteFile(path.Join(p.getPath(), "DEBIAN/control"), p.Ctl.encode(p.version, p.AppName))
	if err != nil {
		return err
	}

	err = utils.WriteFile(path.Join(p.getPath(), "usr/share/applications", p.AppName+".desktop"), p.Desk.encode(p.version, p.AppName))
	if err != nil {
		return err
	}
	return nil
}

// get absolute path
func (p *DebianPack) getPath() string {
	absPath, _ := filepath.Abs(path.Join(p.Path, p.DirName))
	return absPath
}

func (p *DebianPack) entrypoint() []byte {
	out := "#!/bin/sh\n"
	out += path.Join("/usr/lib/", p.AppName, p.AppName)
	return []byte(out)
}

// Build deb
func (p *DebianPack) Build() {
	// create debian directory layout
	p.init()

	// copy all App file to debian directory layout
	for k, v := range p.App {
		v = parseData(v, p.version, p.AppName)
		utils.Execute("cp", "-r", k, p.getPath()+"/"+v)
	}

	// build debian package
	os.Chdir(p.getPath())
	for k, v := range p.CMD {
		v = parseData(v, p.version, p.AppName)
		err := utils.Execute(k, strings.Split(v, " ")...)
		if err != nil {
			log.Fatal(err)
		}
	}
}

// Control struct
type Control struct {
	Options map[string]string `json:"options"`
}

func (c *Control) encode(version, appName string) []byte {
	out := ""

	for k, v := range c.Options {
		v = parseData(v, version, appName)
		out += k + ": " + v + "\n"
	}
	strings.TrimRight(out, "\n")
	return []byte(out)
}

// Desktop struct
type Desktop struct {
	Options map[string]string `json:"options"`
}

func (d *Desktop) encode(version, appName string) []byte {
	out := "[Desktop Entry]\n"
	for k, v := range d.Options {
		v = parseData(v, version, appName)
		out += k + "= " + v + "\n"
	}
	strings.TrimRight(out, "\n")
	return []byte(out)
}

func parseData(v, version, appName string) string {
	if strings.Contains(v, "{{.version}}") {
		v = strings.ReplaceAll(v, "{{.version}}", version)
	}
	if strings.Contains(v, "{{.app_name}}") {
		v = strings.ReplaceAll(v, "{{.app_name}}", appName)
	}
	return v
}
