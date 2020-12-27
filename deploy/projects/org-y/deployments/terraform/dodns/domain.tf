variable "DO_DOMAIN" {
  default = "noviana.xyz"
}
variable "DO_SUBDOMAIN" {
  default = "org-y"
}
variable "DO_A_IP" {}
variable "DO_AAAA_IP" {}

resource "digitalocean_domain" "default" {
  name = var.DO_DOMAIN
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.name
  name = var.DO_SUBDOMAIN
  type = "A"
  value = var.DO_A_IP
}

resource "digitalocean_record" "aaaa" {
  domain = digitalocean_domain.default.name
  name = var.DO_SUBDOMAIN
  type = "AAAA"
  value = var.DO_AAAA_IP
}

resource "digitalocean_record" "cname" {
  domain = digitalocean_domain.default.name
  name = "www.${var.DO_SUBDOMAIN}"
  type = "CNAME"
  value = "${var.DO_SUBDOMAIN}.${var.DO_DOMAIN}."
}

# Output the FQDN for the www A record.
output "www_fqdn" {
  value = digitalocean_record.www.fqdn
}

output "AAAA-www_fqdn" {
  value = digitalocean_record.aaaa.fqdn
}

output "CNAME-www-fqdn" {
  value = digitalocean_record.cname.fqdn
}