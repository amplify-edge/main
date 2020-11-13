local bsTpl = import "../../../bootstrapper/service/go/template.bootstrap.jsonnet";
local cfg = {
    bootstrapConfig: bsTpl.bootstrapConfig {
        savePath: "./bses",
        domain: "getcouragenow.org"
    }
};

std.manifestYamlDoc(cfg)