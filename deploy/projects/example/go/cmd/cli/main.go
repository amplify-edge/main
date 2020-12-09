package main

import (
	"io/ioutil"
	"log"

	"gopkg.in/yaml.v2"
)

type conf struct {
	Hits int64 `yaml:"hits"`
	Time int64 `yaml:"time"`
}

func (c *conf) getConf() *conf {

	yamlFile, err := ioutil.ReadFile("./config/config.yml")
	if err != nil {
		log.Printf("yamlFile.Get err   #%v ", err)
	}
	err = yaml.Unmarshal(yamlFile, c)
	if err != nil {
		log.Fatalf("Unmarshal: %v", err)
	}

	return c
}

func main() {
	// test read files
	log.Print("test read files")
	var c conf
	c.getConf()

	log.Print(c)

	//fmt.Println(c)

	
}

