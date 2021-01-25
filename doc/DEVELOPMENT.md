# Development


## Working on an issue

Developers use the [Kan Ban](https://github.com/orgs/getcouragenow/projects/1) to work out what to work on. Admins only: [Kan Ban](https://github.com/orgs/getcouragenow/projects/1/settings/linked_repositories)

If you want to work on an issue, please first ensure that you understand the issue and the suggested approach. Ask the Team on Telegram if your not sure about something or the best way to approach the implementation.

When you take an issue, please assign yourself to it, so everyone knows your taking it.

## Set up your Environment

The project uses [Flutter](https://flutter.dev/), [Golang](https://golang.org/) and [k3d](https://github.com/rancher/k3d)

In the **shared** repository...

Lets install Flutter and Golang:

```bash
#!/bin/bash
cd boilerplate && make this-all
```

Lets install our tools:

```bash
#!/bin/bash
cd tool && make this-all
```

## Building

Now that you have all the tools setup, you can work on the real code repositories.

In the any repository, you can build using:

```bash
#!/bin/bash

# Build the code
make this-all

# Run the code
make this-run

# Test the code
make this-test

```


## Container based

This is not yet ready !

Use Bazel and Telepresense to have all the code in docker and docker compose and k3d.

## SSH Setup

Note: In the example below:

- the Repo is called ```<REPO>```
- the Forking user is ```<FORKINGUSER>```

```bash
#!/bin/bash

cd $HOME/.ssh

# Delete the shit in your global git config. Your leaking ..
# git config --list
# same but shows where the values come from.
# git config -l

# Make a new key
# ssh-keygen -t rsa -b 4096 -C "<FORKINGUSER>@github.com"

# Add ssh key
# ssh-add ~/.ssh/<FORKINGUSER>@github.com

# Delete ssh key  (if you screw it up)
# ssh-add -d ~/.ssh/<FORKINGUSER>@github.com

# List added ssh
# ssh-add -l

# Add the public key to github on the web site
# https://github.com/settings/keys

```bash
#!/bin/bash

ssh config:

add this to $HOME/.ssh/config

```bash
#!/bin/bash

## <FORKINGUSER>
# https://github.com/<FORKINGUSER>/<REPO>
# e.g: git clone git@github.com-<FORKINGUSER>:<FORKINGUSER>/<REPO>
Host github.com-<FORKINGUSER>
 HostName github.com
 User git
 UseKeychain yes
 AddKeysToAgent yes
 IdentityFile ~/.ssh/<FORKINGUSER>@github.com
```

## Git

Now you setup your filesystem and make any changes and PR it back.

The scripts do all this for you.

```bash
#!/bin/bash

# setup Org folder
mkdir cd $(GOPATH)/github.com/<FORKINGUSER>

# Clone a repo
git clone git@github.com-<FORKINGUSER>:<FORKINGUSER>/<REPO>

# Jump into the repo
cd $(GOPATH)/github.com/<FORKINGUSER>/<REPO>

# CHECK your in the repo
pwd
/Users/apple/workspace/go/src/github.com/<FORKINGUSER>/<REPO>

# Configure it to point to upstream properly
make gitr-fork-setup

```

Your .git/config should now be like this:

```bash

[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
	ignorecase = true
	precomposeunicode = true
[remote "origin"]
	url = git@github.com-<FORKINGUSER>:<FORKINGUSER>/<REPO>
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[remote "upstream"]
	url = git@github.com-<FORKINGUSER>:getcouragenow/<REPO>
	fetch = +refs/heads/*:refs/remotes/upstream/*

```

## Git workflow

Now your setup, you just follow this workflow.

```bash
#!/bin/bash

# Check your workspace.
make gitr-status

# Pull the upstream code changes into your workspace.
make gitr-fork-catchup

# Make a PR from your workspace upstream via your github fork.
make M='<#ISSUENUMBERO> comment ...' gitr-fork-all

```

## CI and CD

When your PR is merged, check it builds correctly and then check the automated release works.

CI: https://github.com/getcouragenow/<REPO>/actions

## Tracking the Channels

**STATUS: Not done yet*

- Git TAGS are used to version the backend and frontend together.

Domains need to be tracked against environments
- Domain Y: env-y.json

Map the git TAGS version to the Channel
- stable: (git-tag X)
- beta: (git-tag Y)
- dev: (git-tag Y)
- ci: ( Master always )

Client/assets/env.json
Server/

## DNS

SRV record matching;

ci=maintemplate.ci.getcouragenow.org

beta=maintemplate.beta.getcouragenow.org

dev=maintemplate.dev.getcouragenow.org

stable=maintemplate.stable.getcouragenow.org