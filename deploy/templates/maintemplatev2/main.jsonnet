local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
    local s = self,
    TLSConfig:: {
        enable: loadVar("MAIN", env="TLS_ENABLE").val,
        isLocal: loadVar("MAIN", env="TLS_LOCAL").val,
        localCertPath: "./certs/local.pem",
        localCertKeyPath: "./certs/local.key.pem",
        rootCaPath: "./certs/rootca.pem"
    },
    mainConfig: {
        domain: loadVar("MAIN", env="DOMAIN").val,
        host: loadVar("MAIN", env="HOST").val,
        port: loadVar("MAIN", env="PORT").val,
        isLocal: loadVar("MAIN", env="IS_LOCAL").val,
        embedDir: loadVar("MAIN", env="EMBED_DIR").val,
        tls: s.TLSConfig,
    }
};

std.manifestYamlDoc(cfg)