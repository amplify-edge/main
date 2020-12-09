local bsTpl = import "../../bootstrapper/service/go/template.bootstrap.jsonnet";
local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
    bootstrapConfig: bsTpl.bootstrapConfig {
        savePath: "./bootstrap-data/server",
        domain: loadVar(prefixName="BOOTSTRAP", env="DOMAIN").val,
    }
};

std.manifestYamlDoc(cfg)