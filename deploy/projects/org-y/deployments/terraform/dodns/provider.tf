terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

variable "DO_TOKEN" {}
variable "DO_PRIVATE_KEY" {}

provider "digitalocean" {
  token = var.DO_TOKEN
}