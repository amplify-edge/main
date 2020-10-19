local accMixin = import "../../sys-account/service/go/template.sysaccount.libsonnet";

local cfg = {
    sysAccountConfig: accMixin.sysAccountConfig {
        unauthenticatedRoutes: accMixin.UnauthenticatedRoutes + [
            "/v2.sys_account.services.AccountService/ListAccounts"
        ],
    }
};

std.manifestYamlDoc(cfg)