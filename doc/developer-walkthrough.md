# Developer Walkthrough

This document is designed for Developers that wish to work on and compile the system.

The system is designed as a modular architecture so that it extensible, and so the way you developer and build it is a little different from standard golang and flutter projects.

The Booty tool helsp wrap those differences..

* These notes are written as short notes and will be filled in going forward...

From nothing you need to:

- Get the Booty develop tool:
	- Download latest release from https://github.com/getcouragenow/booty/releases
	- If you want to work on the code you need:
		- shared repo
		- booty repo

- Get the main code from the repos called:
	- main 
	- mod
	- sys-shared
	- shared
	- sys repo


**deployment flow**
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

## Modules

How to add a new module:

- Add a module to the mod repo, based on mod-dummy.

- Wire it up to Make file, so that CI builds it.

- Wire it up to main using JSONNET

- Add it into the main bootstrap data to creat fake generated bootstrap data.

## Language

How to add a language.

- Add the language identifier at: https://github.com/getcouragenow/sys-share/blob/master/sys-core/service/flu/lib/pkg/i18n/languages.dart

- Run the translation code generator in your flutter module using boots'y bs-trans tool.






