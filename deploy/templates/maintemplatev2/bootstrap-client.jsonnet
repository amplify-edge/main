local bsTpl = import "../../../bootstrapper/service/go/template.bootstrap.jsonnet";
local cfg = {
    bootstrapConfig: bsTpl.bootstrapConfig {
        savePath: "./bootstrap-data/client",
        domain: "getcouragenow.org"
    }
};

std.manifestYamlDoc(cfg)