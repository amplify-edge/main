local loadVar = import "vendor/github.com/amplify-cms/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local prefix = "BUILD";
local cfg = {
    Version:: {
        frontend: loadVar(prefixName=prefix, env="FRONTEND_VERSION").val,
        server: loadVar(prefixName=prefix, env="SERVER_VERSION").val,
        cli: loadVar(prefixName=prefix, env="CLI_VERSION").val,
    },
    ToolVersion:: {
        golang: loadVar(prefixName=prefix, env="GO_VERSION").val,
        flutter: loadVar(prefixName=prefix, env="FLUTTER_VERSION").val
    },
    version: self.Version,
    toolVersion: self.ToolVersion,
    branch: loadVar(prefixName=prefix, env="GITBRANCH").val,
    user: loadVar(prefixName=prefix, env="USER").val,
    date: loadVar(prefixName=prefix, env="DATE").val,
//    inherit: true
};

std.manifestJson(cfg)
