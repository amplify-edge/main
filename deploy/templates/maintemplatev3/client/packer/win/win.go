package win

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"log"
	"maintemplate/packer/utils"
	"os"
	"path"
	"path/filepath"
	"text/template"
)

// https://www.firegiant.com/wix/tutorial/getting-started/the-software-package/

// WindowsPack struct
type WindowsPack struct {
	Version      string
	Path         string            `json:"path"`
	Description  string            `json:"description"`
	Manufacturer string            `json:"manufacturer"`
	DirName      string            `json:"dir_name"`
	AppName      string            `json:"app_name"`
	Icon         string            `json:"icon"`
	Exec         string            `json:"exec"`
	CMD          map[string]string `json:"cmd"`
}

// FromJSON generate deb package from json
func FromJSON(version, configFilePath string) (*WindowsPack, error) {
	data, err := ioutil.ReadFile(configFilePath)
	if err != nil {
		return nil, err
	}
	win := &WindowsPack{}

	err = json.Unmarshal(data, &win)
	if err != nil {
		return nil, err
	}
	win.Version = version
	return win, nil
}

// Build windows
func (p *WindowsPack) Build() {
	os.MkdirAll(p.getPath(), 0755)
	p.generateWXSFile()
}

func (p *WindowsPack) generateWXSFile() {
	// parse model
	out := p.parseTemplat()

	exe, _ := filepath.Abs(p.Exec)

	// copy App in build folder
	utils.Execute("cp", exe, p.getPath()+"/"+p.AppName+".exe")

	// generate template.wxs
	utils.WriteFile(p.getPath()+"/"+p.CMD["wixl"], []byte(out))

	// build windows msi package
	// os.Chdir(path.Join(p.Path, p.DirName))
	// utils.Execute("wixl", "-v", p.CMD["wixl"])
}

func (p *WindowsPack) parseTemplat() string {
	tmp, err := template.New("data").Parse(xml)
	if err != nil {
		log.Fatal(err)
	}
	buf := bytes.Buffer{}
	err = tmp.Execute(&buf, p)
	return buf.String()
}

func (p *WindowsPack) getPath() string {
	return path.Join(p.Path, p.DirName)
}
