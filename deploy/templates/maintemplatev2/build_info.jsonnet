local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local manifest = {
    local cfg = self,
    Version::{
        frontend: loadVar(prefixName="BUILD", env="FRONTEND_VERSION").val,
        server: loadVar(prefixName="BUILD", env="SERVER_VERSION").val,
        cli: loadVar(prefixName="BUILD", env="CLI_VERSION").val,
    },
    ToolVersion::{
        golang: loadVar(prefixName="BUILD", env="GO_VERSION").val,
        flutter: loadVar(prefixName="BUILD", env="FLUTTER_VERSION").val
    },
    version: cfg.Version,
    branch: loadVar(prefixName="BUILD", env="GITBRANCH").val,
    user: loadVar(prefixName="BUILD", env="USER").val,
    date: loadVar(prefixName="BUILD", env="DATE").val,
    toolVersion: cfg.ToolVersion,
};

std.manifestJson(manifest)
