local loadVar = import "vendor/github.com/amplify-edge/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";
local bsTpl = import "../../bootstrapper/service/go/template.bootstrap.jsonnet";

local stringToBool(s) =
  if s == "true" then true
  else if s == "false" then false
  else error "invalid boolean: " + std.manifestJson(s);

local config = {
    local s = self,
    // tls-config
    TLSConfig:: {
      enable: stringToBool(loadVar("MAIN", env="TLS_ENABLE").val),
      isLocal: stringToBool(loadVar("MAIN", env="TLS_LOCAL").val),
      localCertPath: "./certs/local.pem",
      localCertKeyPath: "./certs/local.key.pem",
      rootCaPath: "./certs/rootca.pem"
    },
    // bootstrap-server
    bsCfg:: bsTpl.bootstrapConfig {
      savePath: "./bootstrap-data/client",
      domain: loadVar(prefixName="MAIN", env="DOMAIN").val,
    },
    // main
    mainConfig: {
     domain: loadVar("MAIN", env="DOMAIN").val,
     port: std.parseInt(loadVar("MAIN", env="PORT").val),
     isLocal: stringToBool(loadVar("MAIN", env="IS_LOCAL").val),
     tls: s.TLSConfig,
    },
    // bootstrap
    bootstrapConfig: s.bsCfg,
};

std.manifestYamlDoc(config)
