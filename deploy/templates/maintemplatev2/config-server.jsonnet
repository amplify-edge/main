local accMixin = import "vendor/github.com/amplify-cms/sys/sys-account/service/go/template.sysaccount.libsonnet";
local discoTpl = import "vendor/github.com/amplify-cms/mod/mod-disco/service/go/template.moddisco.libsonnet";
local loadVar = import "vendor/github.com/amplify-cms/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";
local bsTpl = import "../../bootstrapper/service/go/template.bootstrap.jsonnet";

local stringToBool(s) =
  if s == "true" then true
  else if s == "false" then false
  else error "invalid boolean: " + std.manifestJson(s);


local config = {
    local s = self,
    // tls-config
    TLSConfig:: {
      enable: stringToBool(loadVar("MAIN", env="TLS_ENABLE").val),
      isLocal: stringToBool(loadVar("MAIN", env="TLS_LOCAL").val),
      localCertPath: "./certs/local.pem",
      localCertKeyPath: "./certs/local.key.pem",
      rootCaPath: "./certs/rootca.pem"
    },
    // bootstrap-server
    bsCfg:: bsTpl.bootstrapConfig {
      savePath: "./bootstrap-data/server",
      domain: loadVar(prefixName="MAIN", env="DOMAIN").val,
    },
    // mod-disco
    discoCfg:: discoTpl.modDiscoConfig {
       sysCoreConfig: {
           db: discoTpl.CoreDB {
               name: "disco.db",
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="DB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: discoTpl.CoreCron {
               backupSchedule: "@daily",
           },
       },
       sysFileConfig: {
           db: discoTpl.CoreDB {
               name: "disco-files.db",
               encryptKey: loadVar(prefixName="SYS_ACCOUNT", env="FILEDB_ENCRYPT_KEY").val,
               deletePrevious: true,
           },
           cron: discoTpl.CoreCron {
               backupDir: "db/mod/file-backup",
               backupSchedule: "@daily",
          },
       },
       unauthenticatedRoutes: discoTpl.UnauthenticatedRoutes,
    },
    // sys-account
    sysAccountCfg:: accMixin.sysAccountConfig {
        superUserFilePath: "./config/supers.yml",
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
        mailConfig: accMixin.CoreMail,
    },

    // main
    mainConfig: {
     domain: loadVar("MAIN", env="DOMAIN").val,
     host: loadVar("MAIN", env="HOST").val,
     port: std.parseInt(loadVar("MAIN", env="PORT").val),
     isLocal: stringToBool(loadVar("MAIN", env="IS_LOCAL").val),
     embedDir: loadVar("MAIN", env="EMBED_DIR").val,
     tls: s.TLSConfig,
    },
    // bootstrap
    bootstrapConfig: s.bsCfg,
    // mod-disco
    modDiscoConfig: s.discoCfg,
    // sys-account
    sysAccountConfig: s.sysAccountCfg,
};

std.manifestYamlDoc(config)
