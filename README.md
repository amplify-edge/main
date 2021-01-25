# main

All code is compiled from here to build the whole system.

The system is a module architecture.

If you are developing on the system you need the build tools in the shared repo.

User walk through to configure and deploy the system: https://github.com/getcouragenow/main/blob/master/doc/users.md

Dev walk through to config and modify the code: https://github.com/getcouragenow/main/blob/master/doc/developers.md

## Bootstrapper

This folder holds the protos that are used to generate fake test data.

It can be used to bootstrap data for any template.

## Projects

This folder holds example projects.

Each Project follows the exact same structure as a Template with a few extra bits:

- Deployment holds the files used for deployment.
- Config/ is encrypted.

- **deployment flow**
	- Download the latest release artifacts of:
		- binaries
			- server
			- sdk-cli
			- metrics.
				- Victoria Metrics
				- graphana
		- config.
		- bootstrap data.
		- supervisors.
			- linux ( systemd )
			- darwin and windows we DONT have yet.
	- Create a local Project folder
		- Copy Org-y or other project structure locally.
			- TODO: can use the sdk-cli to generate a project template that we embedded into the sdk-cli at buidl time.
		- Create a encryption key ( using bs-crypt)  and put it somewhere you wont loose it.
			- TODO: Need this to be part of sdk-cli
	- Modify config as needed and then encrypt it.
		- smtp, backup URL / token
	- Modify bootstrap data as needed:
		- How do we handle images ?
	- Deploy it
		- SSH script


## Templates

This folder holds the main code of the Server and sdk-cli

It has many templates that show how to run the system as a single bianry or as many binaries on many machines in order to scale the system out.

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



