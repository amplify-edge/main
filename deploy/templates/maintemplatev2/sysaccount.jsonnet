local accMixin = import "vendor/github.com/getcouragenow/sys/sys-account/service/go/template.sysaccount.libsonnet";
local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

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
        sysCoreConfig: {
           db: accMixin.CoreDB {
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="DB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: accMixin.CoreCron {
               backupSchedule: "@daily",
           },
        },
        sysFileConfig: {
           db: accMixin.CoreDB {
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="FILEDB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: accMixin.CoreCron {
               backupSchedule: "@daily",
           },
        },
        mailConfig: accMixin.CoreMail {
            sendgridApiKey: loadVar(prefixName="SYS_ACCOUNT", env="SENDGRID_API_KEY").val,
        },
    }
};

std.manifestYamlDoc(cfg)