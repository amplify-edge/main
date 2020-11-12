local cfg = {
    local s = self,
    TLSConfig:: {
        enable: true,
        isLocal: true,
        localCertPath: "./certs/local.pem",
        localCertKeyPath: "./certs/local.key.pem",
        rootCaPath: "./certs/rootca.pem"
    },
    mainConfig: {
        port: 9074,
        isLocal: true,
        embedDir: "../client/build",
        tls: s.TLSConfig,
    }
};

std.manifestYamlDoc(cfg)