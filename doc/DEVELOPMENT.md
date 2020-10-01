# Development

## Project docs

This contains the Functional modules and runner.

Project Web site: https://getcouragenow.org/

Project Docs: https://docs.google.com/document/d/1caq1gSvHqVXVCOCGPsqi7I0fbF-Gdyryd07CL9yJ55o



## Developer setup and help

The project uses [Flutter](https://flutter.dev/), [Golang](https://golang.org/) and [Kubernetes](https://kubernetes.io/)

However, you need to make sure you have all extra dependencies setup first, if you want to extend the system. See the boilerplate OS folder where scripts are there to do this for you.

## Tools

With Flutter and golang installed, you can install our tools



## Building

See MainTemplate folder for Client and Server makefiles:

https://github.com/getcouragenow/packages/tree/master/maintemplate


In maintemplate, Run  ```make build-all```, and it will put all build tools into the go bin.


## Running

In maintemplate, Run  ```make run-all```, and it will run the code.


## Working on an issue

The [Kan Ban](https://github.com/orgs/getcouragenow/projects/1) should be looked at to work out what to work on.

Is you want to work on an issue, please first ensure that you understand the issue and the suggested approach. Ask the Team on Telegram if your not sure about something or the best way to approach the implementation.

When you take an issue, please assign yourself to it and let everyone know on the Telegram group, so we everyone knows your taking it.

---

## CI and CD

When your PR is merged, check it builds correctly and then check the automated release works.

CI: https://github.com/getcouragenow/packages/actions


### Tracking the Channels

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