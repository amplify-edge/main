build {
  sources = [
    "sources.hcloud.main"
  ]

  provisioner "shell" {
    inline_shebang = "/bin/sh -eux"
    inline = [
      <<EOF
        timedatectl set-timezone UTC
        localectl set-locale LANG=en_US.UTF-8
      EOF
      ,
      <<EOF
        echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" | tee -a /etc/apt/sources.list.d/caddy-fury.list
        apt update -y && apt install -y caddy
      EOF
    ]
  }

  provisioner "ansible" {
    galaxy_file = "./ansible/requirements.yml"
    playbook_file = "./ansible/playbooks/init.yml"
    extra_arguments = [
      "-e",
      "@ansible/extra_vars.yml",
      "--vault-password-file",
      "ansible/.passwordfile"
    ]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/playbooks/sudoers.yml"
    extra_arguments = [
      "-e",
      "@ansible/extra_vars.yml",
      "--vault-password-file",
      "ansible/.passwordfile"
    ]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/playbooks/post_init.yml"
    extra_arguments = [
      "-e",
      "@ansible/extra_vars.yml",
      "--vault-password-file",
      "ansible/.passwordfile"
    ]
  }
}