local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local stringToBool(s) =
  if s == "true" then true
  else if s == "false" then false
  else error "invalid boolean: " + std.manifestJson(s);

local cfg = {
    local s = self,
    TLSConfig:: {
        enable: stringToBool(loadVar("MAIN", env="TLS_ENABLE").val),
        isLocal: stringToBool(loadVar("MAIN", env="TLS_LOCAL").val),
        localCertPath: "./certs/local.pem",
        localCertKeyPath: "./certs/local.key.pem",
        rootCaPath: "./certs/rootca.pem"
    },
    mainConfig: {
        domain: loadVar("MAIN", env="DOMAIN").val,
        host: loadVar("MAIN", env="HOST").val,
        port: std.parseInt(loadVar("MAIN", env="PORT").val),
        isLocal: stringToBool(loadVar("MAIN", env="IS_LOCAL").val),
        embedDir: loadVar("MAIN", env="EMBED_DIR").val,
        tls: s.TLSConfig,
    }
};

std.manifestYamlDoc(cfg)