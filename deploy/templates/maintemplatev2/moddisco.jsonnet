local discoTpl = import "vendor/github.com/amplify-cms/mod/mod-disco/service/go/template.moddisco.libsonnet";

local cfg = {
    modDiscoConfig: discoTpl.modDiscoConfig {
        unauthenticatedRoutes: discoTpl.UnauthenticatedRoutes,
    }
};

std.manifestYamlDoc(cfg)