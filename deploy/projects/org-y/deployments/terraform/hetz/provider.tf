terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.23.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}