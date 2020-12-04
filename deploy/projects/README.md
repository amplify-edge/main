# Projects

Each Project has:

- data
	- server
		- volume for server db and bootstrap data sent to server
	- cli
		- bootstrap data.

- version.go
	- githash
		- so we can go backwards in time
		- other standard stuff..

- assets.go
	- flutter inside the assets.go ( yes its big but thats ok ).

- config.yaml
	- Secrets ?? sops and ages.
	- age passphrase is held in fly.

- domain / Certs
	- 
- meta
	- email account ( used for fly )
	- fly org
	- fly subdomain
	- secrets ID ( key stored elsewhere that mas ID to key.)

