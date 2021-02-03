local accMixin = import "vendor/github.com/amplify-cms/sys/sys-account/service/go/template.sysaccount.libsonnet";
local loadVar = import "vendor/github.com/amplify-cms/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
    sysAccountConfig: accMixin.sysAccountConfig {
        unauthenticatedRoutes: accMixin.UnauthenticatedRoutes + [
            "/v2.sys_account.services.OrgProjService/ListOrg",
            "/v2.sys_account.services.OrgProjService/ListNonSubscribedOrgs",
            "/v2.sys_account.services.OrgProjService/ListProject",
            "/v2.sys_account.services.OrgProjService/GetOrg",
            "/v2.sys_account.services.OrgProjService/GetProject",
            "/v2.mod_disco.services.SurveyService/ListDiscoProject",
            "/v2.mod_disco.services.SurveyService/GetDiscoProject",
            "/v2.mod_disco.services.SurveyService/GenTempId",
            "/v2.mod_disco.services.SurveyService/ListSurveyProject",
            "/v2.mod_disco.services.SurveyService/GetSurveyProject",
            "/v2.mod_disco.services.SurveyService/NewSurveyUser",
        ],
        initialSuperUsers: [
            {
                email: "superadmin@amplify-cms.org",
                password: "superadmin",
                avatar: "iVBORw0KGgoAAAANSUhEUgAAAIAAAACAAQMAAAD58POIAAAABlBMVEUFLV4aVVvN7byTAAACp0lEQVR4nHyVTRKdOAyE5WHhzdR4lrMa5yZcJUfIDfDNwlE4Akun8opOSS1LZBOqHo/6gEY/bVkOAPiOR3gU2RXsgINNOoAnQZUG4LMDg6BJBTATdNkA3DtwEuxSAFwJDhEA5w5cBBANZAQoEA1EfzfDgEjHk6BCpOGjYDIMKJwJOvS1W8GHYUCFrwSH5oRTAfO3JI8RoBjYLRYwDP37P0G1v78JhoXhhVqgL6B1PN+gOohXrEohyggNbAE68y/ZDi9IgOL5HwvIQbAH6My/B6gELUBh/jWAHM9qQ4isRoXIamWIDG92iAzaIUVOGiZFDLQExQxRE8hXC+QF/rXn5Lcj/HpKGW+wDdlOVoWgDanXG+wizUsaGfX5Atsjsn+8XybxeH0W0Lt2tTnAR++NABumXp40gZV+6uUVYMetxrjNHuZT3Nr9ucCGsHI30BQc5lwCW29Yl+Ca0xAxCDSYoSecNgdMeWgAVAIfU4qbSnZSeUy9fngiKEn5Cv2s00Ioah8k4Gc3C9feY2DVMsQ6w4tiATC5ZnUksPSbeZVLxwrUze8EjWW7CFhvLdsIYG3YH+/vEDbqmAmslcf1coA2m+Z+NXyNEPvvU8p8g3a7lcWnT73Uiy+wnfKXOLBXy5A/Hv+9ru3Rf17gdG/HcflH4zCP15lgLnOvg2EhRXwopojPgBTxqqQIRz5SBL7YQoTz60iRNa5ChPXJDcb1e2wfEqN2BvDJ+gS4CJYI52ZF7kH2ckWI8ImN4EtoOPgWX6HvZUYcBOWTY9mAlTZ2GlvwkZx6e0oza88EXT/gO55tbLuthivBoXd9X+1cf3O1wUAxe/k0bMDkmnsScOIwDM1/skozAbcuhqH562aPS64Ehy1I3951C+KIGAF+AGvbZf4/FTy/AgAA//+mGQr4LxPDRAAAAABJRU5ErkJggg"
            }
        ],
        sysCoreConfig: {
           db: accMixin.CoreDB {
               name: "sysaccount.db",
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="DB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: accMixin.CoreCron {
               backupSchedule: "@daily",
           },
        },
        sysFileConfig: {
           db: accMixin.CoreDB {
               name: "sysfiles.db",
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="FILEDB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: accMixin.CoreCron {
               backupDir: "db/sys/sysfiles-backup",
               backupSchedule: "@daily",
           },
        },
        mailConfig: accMixin.CoreMail //{
//            sendgrid: accMixin.CoreMail.sendgrid {
//                apiKey: loadVar (prefixName="SYS_ACCOUNT", env="SENDGRID_API_KEY").val,
//            }
//        },
    }
};

std.manifestYamlDoc(cfg)
