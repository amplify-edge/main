local bsTpl = import "../../bootstrapper/service/go/template.bootstrap.jsonnet";
local cfg = {
    bootstrapConfig: bsTpl.bootstrapConfig {
        savePath: "./bootstrap-data/server",
        domain: "getcouragenow.org"
    }
};

std.manifestYamlDoc(cfg)