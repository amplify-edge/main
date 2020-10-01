# main

All code is compiled from here, except for the SDK down in sys.

Follow the rabbit hole down ...

## Templates

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


## Imports

This imports the go grpc packages for all the modules in sys and does all the boilerplate to use them.

Its intended to then be used by the other mains.

It is then imported by Repo main/deploy/maintemplatev2 and Repo main/deploy/maintemplatev3

maintemplatev2

- single binary
- so maintemplatev2/server imports Repo sys-shared/main/service.
- so maintemplatev2/server imports Repo mod/main/service.

maintemplatev3

- dual Sys and mod binary
- so maintemplatev3/mainsys imports Repo sys-shared/main/service.
- so maintemplatev3/mainmod imports Repo mod/main/service.

## Wrapper

Maybe needed...
pkg that imports the sys go grpc client pkg for all the modules in sys so others do not have to do a ton of boilerplate.

## SDK

Maybe Imports the client wrapper ...

Used at gen time and runtime.

At gen time it does all the stuff a dev needs.
It needs a real Server running to connect to also, because of the migrations aspects.

At run time, it allows you to do ops style things, like running migrations or importing data.

You can also ask it to open the Flutter web GUi if you prefer.

## Server

Maybe: Imports the server wrapper ...

Runs the Server.
Runs the Flutter GUI.
