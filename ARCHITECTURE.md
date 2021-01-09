# Architecture

maintemplate2 is a container that loads up all of the other modules.

- mod modules
- sys modules


Sys-main is a container that loads up all of the other sys modules.

- sys-core
- sys-accounts
- any other SYS modules needed.

---

## Modules

Main modules (sys-main and maintemplate2) are special in that they do nothing except load up the Modules is choose to use at compile time.

In each Module you will always find the following structure.

### Client

The reusable widgets.

The GUI that also uses the widgets. We need this to check our widgets works, and also to admin the data.

### Server

The golang API and functionality and DB Tables, Schema, and Migrations.
Each DB has its own Prefix such as "mod_main_tableX". Always use an underscore "_" :)

---

## Modular Architecture Design

The Architecture is designed to be modular, so that Customers can replace any SYS or MOD module.

Sys-main exists so that other Customers can make their own sys-main and load different sys modules if they need to.

Its also exists because it will allow us to run SYS and MOD as different Servers later in V3 and V4.

### High Level Architectural Roadmap

For V2, we run the golang and flutter compiled together respectively.

- maintemplate2/server imports sys-main/server, and so maintemplate2/server has very little in it.
- There is only one DB.

For V3, we will be able to run the golang parts as their own binaries

- Can use k3d and nomad. See the Scaling doc...
- Each golang SYS and MOD can be compiled distinctly and so do basic scaling. This is possible Now because there is only one DB.
- Each golang SYS and MOD can be compiled distinctly and so do basic scaling. NO Raft is needed because we are just sharding the DB and so is possible now.

For v4, we will be able many instances of each golang MOD as their own binaries.

- Each golang SYS and MOD can be compiled distinctly and have many of them respectively. This requires genji to be extended with RAFT, which is not an issues.


The same is true for all the Flutter modules in that they can run in distinct apps with deep linking linking them up at runtime. This can be required for Cognitive Information Architecture and UX.


## SYS Modules

### sys-main

- Just a shell that holds the imports, and gets sys-core to do the real work.

- Flutter layer loads the Flutter SYS Modules and controls the main Flutter routes.
- Golang layer loads the Golang SYS Modules and controls the main GRPC routes.

- At compile time, all other SYS module Config, embedded assets ( DB migrations, Data boostrappers, etc) are compiled in.  This allows sys-main to provide them to sys-core to do its work.

- The config file lives here on disk
- The DB file lives here on disk.

### sys-core

- Loads up the Modular Config, DB, DB Migrations, any provisioning and upgrading.
- Has Flutter Widgets used by SYS and MOD modules ( e.g client/gc_master_detail.dart which make all GUI responsive for large and small screens)
- Has a Flutter Pages for SuperAdmin to manage the system.
- Has a CLI to help a SuperAdmin manage the system.
- Has a small GRPC API for its Flutter Pages / Widgets to use.
- Has its own DB


### sys-X ( accounts, timespace, etc)**

- Have their own DB, DB migrations.
- Have their own Data Bootstrappers.
- Have their own Config.
- Have their own GRPC API.
- Have their own Widgets ( used by the MOD modules).
- Have their own Pages ( used by SuperAdmin).


## Mod Modules

These are essentially the same architectural design, with the Flutter and Golang code importing the SYS modules are they need.

They have their own DB Tables.

The can use the SYS modules Widgets.

