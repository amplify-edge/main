# Security


The Architecture is designed to be an End to End secure system.

See the [sys-core](https://github.com/getcouragenow/packages/tree/master/sys-core) for the code and domain model and the roles and permissions.

## Checks for User

https://www.cloudflare.com/ssl/encrypted-sni/
- you need ALL 4 to pass in your browser

https://1.1.1.1/help
- another check which sucks

1. Set DNS on your mac
- For IPv4: 1.1.1.1 and 1.0.0.1. 
- For IPv6: 2606:4700:4700::1111 and 2606:4700:4700::1001.

2. Firefox

Only Firefox has all 4 that you need:
use these settings: https://www.inmotionhosting.com/support/website/security/dns-over-https-encrypted-sni-in-firefox/

3. If you must use Chrome:
Chrome:
chrome://flags/#dns-over-https
chrome://flags/#enable-webrtc-hide-local-ips-with-mdns
chrome://flags/#dns-httpssvc

4. IOS and MAC profiles to force DOH to work

https://github.com/AdguardTeam/AdGuardHome/issues/2110

here are the profiles already done.
https://github.com/paulmillr/encrypted-dns


## Check the Server

We need to use this code and integrate it.

https://github.com/nextdns/nextdns/blob/master/service.go
https://github.com/nextdns/nextdns/tree/master/host

We will implement the DNS and ESNI check also into your own server.
SO we can tell the user they are leaking and advice them

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

- Generates it own private key and gives the public key to the Server.
- Public key stored in Server ( gateway )

DNS

- DNS inspection can be reduced if the users use an Encrypted DNS, and they are becoming more and more common.
- We do not want to introduce Wireguard VPN as it tends to expose the user to the WebRTC leak hack.
	- Tailscale was a Wireguard Server and client that circumvents the WebRTC leak, but we really prefer standard Encrypted DNS mainstream and aim to develop in that vein.

Transport

- Uses TLS 1.3 with Certs auto issued by Lets Encrypt.
- Client and Server checks the TLS Certificate.

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
