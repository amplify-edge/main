package main

// Generate k8s secrets in secrets directory containing minio
import (
	"encoding/base64"
	"flag"
	"fmt"
	"log"
	"os"
	"text/template"
)

var (
	secretsTemplate = `apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: {{ .SecretsName }}
data:
  accesskey: {{ .MinioAccessKey }}
  secretkey: {{ .MinioSecretKey }} {{ if eq .MinioSecrets false }}
  enckey: {{ .MinioEncKey }}
  endpoint: {{ .MinioEndpoint }}
  location: {{ .MinioLocation }}
  ssl: {{ .MinioUseSSL }}
  timeout: {{ .MinioTimeout }}
  {{ end }}
`
	outname = flag.String("o", "./secrets", "Choose path to store the output secrets")
)

// appsecrets
type appsecrets struct {
	MinioSecrets   bool
	SecretsName    string
	MinioAccessKey string
	MinioSecretKey string
	MinioEncKey    string
	MinioEndpoint  string
	MinioLocation  string
	MinioUseSSL       string
	MinioTimeout   string
}

func newAppSecrets(isMinio bool, name string) *appsecrets {
	return &appsecrets{
		MinioSecrets:   isMinio,
		SecretsName:    name,
		MinioAccessKey: toB64(os.Getenv("MINIO_ACCESSKEY")),
		MinioSecretKey: toB64(os.Getenv("MINIO_SECRETKEY")),
		MinioEncKey:    toB64(os.Getenv("MINIO_ENCKEY")),
		MinioEndpoint:  toB64(os.Getenv("MINIO_ENDPOINT")),
		MinioLocation:  toB64(os.Getenv("MINIO_LOCATION")),
		MinioUseSSL:    toB64(os.Getenv("MINIO_SSL")),
		MinioTimeout:   toB64(os.Getenv("MINIO_TIMEOUT")),
	}
}

func toB64(inputstring string) string {
	return base64.StdEncoding.EncodeToString([]byte(inputstring))
}

func main() {
	flag.Parse()
	minioSec := newAppSecrets(true, "minio-creds-secret")
	appSec := newAppSecrets(false, "getcourage-secret")
	t := template.Must(template.New(*outname).Parse(secretsTemplate))
	if err := minioSec.writeSecrets(t, *outname); err != nil {
		log.Fatalf("Error writing minio secrets: %v", err)
	}
	if err := appSec.writeSecrets(t, *outname); err != nil {
		log.Fatalf("Error writing app secrets: %v", err)
	}
}

func (a *appsecrets) writeSecrets(tpl *template.Template, path string) error {
	fname := fmt.Sprintf("%s/%s.yaml", path, a.SecretsName)
	file, err := os.OpenFile(fname, os.O_WRONLY|os.O_CREATE|os.O_EXCL, 0644)
	if err != nil {
		return err
	}
	return tpl.Execute(file, a)
}
