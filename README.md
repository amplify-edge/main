# main

**GetCourageNow.org** - A non-profit providing secure, open source, self organising software for Climate Change campaign organisations.

## Introduction

This project provides a platform offering real time collaboration to allow organisations to collaborate around a campaign.

## Demo

Web CI : https://org-y.getcouragenow.org/

## Installation and Walkthrough docs

User walkthrough to configure and deploy the system: https://github.com/getcouragenow/main/blob/master/doc/user-walkthrough.md

Dev walkthrough to config and modify the code: https://github.com/getcouragenow/main/blob/master/doc/developers-walkthrough.md

## Design docs

See the [ARCHITECTURE.md](https://github.com/getcouragenow/main/tree/master/doc/ARCHITECTURE.md) for information on the architecture on the system.

See the [DEVELOPMENT.md](https://github.com/getcouragenow/main/tree/master/doc/DEVELOPMENT.md) for information on developing on the system.

See the [DEPLOYMENT.md](https://github.com/getcouragenow/main/tree/master/doc/DEPLOYMENT.md) for information on deploying the system.

See the [DEPLOYMENT.md](https://github.com/getcouragenow/main/tree/master/doc/MODULES.md) for information on the modularity of the system.

See the [SECURITY.md](https://github.com/getcouragenow/main/tree/master/doc/SECURITY.md) for information on the security of the system.

## Project docs

The [Project Website](https://getcouragenow.org/) gives a general introduction about what the software is used for, the organisation behind it.

The [Project Docs](https://docs.google.com/document/d/1caq1gSvHqVXVCOCGPsqi7I0fbF-Gdyryd07CL9yJ55o) explains the functionality.

## Contacts

You can contact us at [Email](mailto:contact@getcouragenow.org) regarding any questions or if you would like a demo of the system.

If your a developer and want help then your free to contact the DEV Team at [Telegram: https://t.me/gcn_dev](https://t.me/gcn_dev).

## CI

**STATUS: Not yet...**

https://github.com/getcouragenow/main/actions

## Releases

**STATUS: Not yet...**

https://github.com/getcouragenow/main/releases


## High Level code structure

All code is compiled from here to build the whole system.

The system is a module architecture.

If you are developing on the system you need the build tools in the shared repo.

**deploy/bootstrapper**

This folder holds the protos that are used to generate fake test data.

It can be used to bootstrap data for any template.

**deploy/projects**

This folder holds example projects.

Each Project follows the exact same structure as a Template with a few extra bits:

- Deployment holds the files used for deployment.
- Config/ is encrypted.

**deploy/templates**

This folder holds the main code of the Server and Cli.

It has many templates that show how to run the system as a single binary or as many binaries on many machines in order to scale the system out.

If you look at maintemplatev2 you see our common patterns:

- cli-commands.go contains all instantiation code for loading the cli and all the sub modules.
- server_commands.go contains all instantiation code for loading the server and all the sub modules.
- bootstrap-data/ holds the template used to bootstrap data.
- client/ holds the main flutter client that then loads all the sub modules 
- config/ holds the configs for the sub modules.
- main/ holds the primary boot code of the Server and sdk-cli . It calls the server_commands.go and cli-commands.go respectivly.
- wrapper/ holds some shared util code that all the above uses.

See the README for each template to see how to build and run the code.

- **maintemplatev2**
	- single binary, and all architype
	- Single config.
	- Archetype
		- Main
			- make

- **maintemplatev3**
	- 2 binaries , all architypes
	- Config per physical architype
	- Archetype
		- MainSys
			- make
		- MainMod
			- make