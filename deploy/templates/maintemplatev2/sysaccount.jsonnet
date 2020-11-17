local accMixin = import "vendor/github.com/getcouragenow/sys/sys-account/service/go/template.sysaccount.libsonnet";

local cfg = {
    sysAccountConfig: accMixin.sysAccountConfig {
        unauthenticatedRoutes: accMixin.UnauthenticatedRoutes + [
    "/v2.sys_account.services.OrgProjService/ListOrg",
    "/v2.sys_account.services.OrgProjService/ListProject",
    "/v2.mod_disco.services.SurveyService/ListDiscoProject",
    "/v2.mod_disco.services.SurveyService/GetDiscoProject",
        ],
        initialSuperUsers: [
            {
                email: "superadmin@getcouragenow.org",
                password: "superadmin",
                avatarFilepath: "./testdata/default/default_root_avatar.png",
            }
        ],
    }
};

std.manifestYamlDoc(cfg)