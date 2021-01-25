# Security


The Architecture is designed to be an End to End secure system.

See the [sys-core](https://github.com/getcouragenow/sys/tree/master/sys-core) for the code and domain model and the roles and permissions.

## Development Status

https://github.com/getcouragenow/sys-share is a good place to start

This is system code that is shared with the Modules. Modules are written by others.

https://github.com/getcouragenow/sys is the next place to look.

This is where all state is stored. Its a bit beta. We plan to go back into that and do a fair bit of work.

The database encryption and back up is there and works. Its pretty fresh code.

The Sys-share Repo has a CLI, and you can Auth and interact with the systhem using it.

Everything uses Protobufs. Why ? So that the API is tight and is code generatd. Less developer slips ups then. The CLI that uses the GRPC Protobufs is itself code generated from the Protobufs.

JWT is used for Auth.

AuthZ is Not enforced yet. It will be soon. We are working on it this week.

Validation of Protobufs will happen very soon. This is also code generated. We are just waiting on a release from Google fo that lib as its not currently compatible with the code generator we are using. I expect it to be a week or 2 away.

## Wire level Security

Benefits of securing the wire between a users device and the Servers:

All the ESNI and other related security technologies remedies all the BS security and anonymising aspects.

100% encrypted and anonymized.

We do not want to introduce Wireguard VPN as it tends to expose the user to the WebRTC leak hack.

Orgs run 100% of their systems fully secure by using the security tools.
Orgs should run in Iceland.

So chrome or any tool on their desktop or mobile will be automatically secure and anonymous. For their whole org !!

Anyone in the public will see a warning when they connect telling them how to get secure.
The tool we am developing means they  just download and run it and it’s all done for them. Idiot proof.
Then they reconnect and it shows them they are fully secure and anonymous.

No VPN needed.

Any users leaking to any other internet entity can be detected, and we can show them and their OrgAdmin as a summary.


## Server detection

Benefits of Tunnel:

STATUS: in exp.

## Modules

Each Module needs security to be applied.

### Client

For client security, all data is gotten from the server/sys-core and enforced by the client/sys-core code.

Routing guards enforce what the user can route to and is enforced by sys-core.

Navigation GUI guards enforce what the user sees is enforced by sys-core.

With regards RTC ( like chat), access and functions that a client can perform is enforced by sys-core.

### Server

Each Module uses GRPC and so Auth and Authz is enforced automatically by the GRPC middleware that sys-core loads.

Each Module owns the DB tablespace it uses, and the sys-core enforces that they can only acces their tables. This means that a third party module can not access another Modules data.

At the DB query layer, the domain model describes the Authz permissions and is enforced by sys-core.

---

## Security Architecture

All security aspects are enforced in sys-core to remediate developers accidentally making mistakes.

The layer cake of the End to End looks like this.

Client

- Generates it own private key and gives the public key to the Server ( Public key stored in Server ).
- private master key stored in TPM chips via OS keychain.
- Keys rotation.


DNS

- Ours

Transport

- Uses TLS 1.3 with Certs auto issued by Lets Encrypt.
- Client and Server checks the TLS Certificate.

Tunnel

- They packets pass in and out of our tunnel.

Server

- State is encrypted in the DB
- Master key stored in TPM chips via OS keychain.
- Keys rotation.


### High Level Security Roadmap

**V2**

Only single server and RPC.

TLS
- Auto Certs

Server
- DB is encrypted, ensuring that Admins runnng the system cannot see he data.

**V3**

Many Servers sharded and Client doing small amount of RTC.

Client

- Private key and Public key introduced because we start to use RTC ( eg Chat )

Server

- Global Registry Server introduced will be needed to hold DB master keys, Transport certs, Client Pub keys
- MTL Certs used between Global Registry Server and Servers.

**v4**

we will be running many instances of each golang MOD as their own Servers

No real changes needed.
