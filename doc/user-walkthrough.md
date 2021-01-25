# User Walkthrough

This document is designed for Users that wish to deploy the system.


## Download

The binaries are cross platform and you can run all downloads on Windows, Mac, Linux.

- CLI binary allows you to remotely talk to the server from your laptop, plus to:
	- Upload the encrypted config and bootstrappers.
	- Activate a bootstrap that you uploaded to the server

- Server binary is the only binary needed for the server. There are no other dependences like databases etc, because the server has an embedded encrypted database.

- Booty helps you to locally configure the data that drives the system to:
	- encrypt the config before you upload it to the server.
	- encode the images into the bootstrap.
	- Upload the config and bootstrap to the server.


**Curl based downloads**

Server:

```bash
curl -sfL https://install.goreleaser.com/github.com/goreleaser/goreleaser.sh | sh
```

Cli:

```bash
curl -sfL https://install.goreleaser.com/github.com/goreleaser/goreleaser.sh | sh
```

Booty:

```bash
curl -sfL https://install.goreleaser.com/github.com/goreleaser/goreleaser.sh | sh
```

**Release downloads**

Server and CLI: https://github.com/getcouragenow/main/releases

Booty: https://github.com/getcouragenow/main/releases.

## Play with the Demo

Its best to get familiar with the system by playing with the Demo that is deployed by the dev team each day.

We call it org-y, and is all machine generated. The config and bootstrap data is at: https://github.com/getcouragenow/main/tree/master/deploy/projects/org-y

Its is deployed to https://org-y.getcouragenow.org/

The Server boots with a hardcoded superadmin account that is hardcoded into the code. When you login and change it, the new one will be saved into the encrypted DB, and the one hard coded into the code will be ignored.

The bootstrap data has all the data, including all accounts other than super admin.

superadmin role:

- username: superadmin@getcouragenow.org
- password: superadmin

orgadmin

- username: ?@email.org
- password: ?

projectadmin:

- username: ?@email.org
- password: ?


After you have played with the Live demo, you should move on to "Running it locally".

## Provisioning locally

Running  Booty, Cli and Server locally is a good way to check everything works before you Deploy to a real Server.

Copy the existing Org-x project: https://github.com/getcouragenow/main/tree/master/deploy/projects/org-x


Follow these steps:

0. Install the booty tools

- TODO: booty commands ( joe ? ) 

- TODO: Might as well use caddy too locally..

- Now you have the various tools installed that booty needs.

1. Use booty to make a SSL local cert for the Server

- TODO: booty commands ( alex ? )

- Now try: https://127.0.0.1:443

1. Start the server. It is hardcoded with a super admin of:

- username: superadmin@domain.org
- password: superadmin

- TODO: server command

- Because it has no config it will error at http://127.0.0.1:80

3. Edit your config using booty tools, and upload it to the server.

- TODO: booty commands ( alex ? )

- TODO: CLI commands to upload the config.

- Now you must restart the Server for the config to be seen by the Server.

- When the config is applied, you can test the for email, works by ?? Alex ?


4. Edit the bootstrap using booty tools, and upload it to the server.

- TODO: Description of what bits to edit...

- TODO: Booty commands ( alex ? )

- After you have gotten it running locally, you should move on to "Provisioning remotely".

## Provisioning remotely

This is exactly the same process as what you did locally, except that you are doing it to a Remote production server.

You should make a new folder for this because your config will be different from local one.

SSH to your Server so you can install the binary:

- Curl it down.
- Install systemd
- start it

Now locally, just follow the same steps from Step 0 onwards.

Highlight anything different. Caddy for exmaple and SSL Certs..


- TODO. Domain repointing... When in the steps... Assume ONLY after new config applied that causes the new SuperAdmin to be applied fromthe config.