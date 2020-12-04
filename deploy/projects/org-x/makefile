FLY=flyctl

SUBDOMAIN=org-x.gcn

print:

	@echo -- Org-x --
	@echo SUBDOMAIN: $(SUBDOMAIN)

run:
	go run ./cmd/server/main.go

fly-init:
	#$(FLY) auth signup
	$(FLY) auth token
	$(FLY) auth whoami

	$(FLY) init

fly-deploy:
	$(FLY) deploy

fly-open:
	$(FLY) open

fly-status:
	$(FLY) info
	$(FLY) status
	$(FLY) ips list

fly-log:
	$(FLY) logs

fly-secrets:
	$(FLY) secrets set BANKPASSWORD="M0M0NEY"
	$(FLY) secrets list

fly-volume:
	$(FLY) volumes list
	#flyFLY volumes create <name> --region ewr --size 1

fly-cert:
	$(FLY) certs add getcourage.org