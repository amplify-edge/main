# dev



# flutter layer
- use Jwt
	- https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/jwt_authn_filter#config-http-filters-jwt-authn

# envoy / k8  layer
- Envoy can do the auth for us. How ?
- General auth
- Can it do Authz (rbac)
	- doc:https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/filter/http/ext_authz/v2/ext_authz.proto
	- code: https://github.com/envoyproxy/go-control-plane/blob/master/envoy/config/filter/network/ext_authz/v2/ext_authz.pb.go
	- examples:
		- https://medium.com/google-cloud/envoy-external-authorization-server-envoy-ext-authz-helloworld-82eedc7f8122
			- https://github.com/salrashid123/envoy_external_authz
- How to update envoy ?
	- If its doing some auth and authz for us it needs data to drive it.
	- If we have that data in minio, we can update it. Others us trafik etc

# golang layer
- gprc
	- so that everyone can use it.
	- like a side car 
- then talk to minio, etc
- envoy maybe can do role check too ?
	- e.g User is Role OrgAdmin, and so can see the mod-main Dashboard
- envoy calls "Check function on us, where we check if the user can access the URL
	- e.g Orgs/1. Can the use access or Org 1 ?

# paas layer
When to store accounts ? 
- Minio

- DO we also check authz here ?
	- I dont think its needed because golang layer does it all.


