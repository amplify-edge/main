# Developers

This document is designed for Developers that wish to deploy the system.

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






