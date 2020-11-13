local discoTpl = import "vendor/github.com/getcouragenow/mod/mod-disco/service/go/template.moddisco.libsonnet";

local cfg = {
    modDiscoConfig: discoTpl.modDiscoConfig {
        unauthenticatedRoutes: discoTpl.UnauthenticatedRoutes,
    }
};

std.manifestYamlDoc(cfg)