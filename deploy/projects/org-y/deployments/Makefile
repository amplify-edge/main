BPASSWD := ???
VAULT_ID := testbed0

.PHONY: all deps encrypt init sudoers post-init

all: deps encrypt init sudoers post-init

deps:
	ansible-galaxy install -r requirements.yml

encrypt:
	@ansible-vault encrypt_string --output extra_vars.yml --vault-password-file .passwordfile '${BPASSWD}' --name 'gcn_become_password' > extra_vars.yml

init:
	ansible-playbook -i ./inventories/init --vault-password-file .passwordfile -e '@extra_vars.yml' ./playbooks/init.yml

sudoers:
	ansible-playbook -i ./inventories/init --vault-password-file .passwordfile -e '@extra_vars.yml' ./playbooks/sudoers.yml

post-init:
	ansible-playbook -i ./inventories/post_init --vault-password-file .passwordfile -e '@extra_vars.yml' ./playbooks/post_init.yml