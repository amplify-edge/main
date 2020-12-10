package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
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
	var c conf
	c.getConf()

	fmt.Println(c)

	r := gin.Default()
	r.LoadHTMLGlob("./resources/templates/*")

	r.GET("/", handleIndex)
	r.GET("/:name", handleIndex)
	r.Run(":8080")
}

func handleIndex(c *gin.Context) {
	name := c.Param("name")
	if name != "" {
		name = strings.TrimPrefix(c.Param("name"), "/")
	}
	c.HTML(http.StatusOK, "hellofly.tmpl", gin.H{"Name": name})
}
