# Packer Setup

### Purpose

- This packer setup is to setup ready to use snapshot for the application
- Currently it supports Hetzner only

### Spec

The snapshot in question has to be secure, and contains as minimal dependencies as we possibly can.

1. Utilizes tried and true ansible remote provisioner
2. Conform to best practices in ssh and os hardening practice. 
3. Uses caddy for reverse proxy (automatic tls fetching)
4. Systemd to manage services.