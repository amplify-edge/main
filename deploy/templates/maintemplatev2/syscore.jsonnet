local coreTpl = import "vendor/github.com/getcouragenow/sys/sys-core/service/go/template.syscore.libsonnet";
local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
    sysCoreConfig: {
       db: coreTpl.CoreDB {
           name: "gcn.db",
           encryptKey: loadVar(prefixName="SYS_CORE", env="DB_ENCRYPT_KEY").val,
           dbDir: "./db",
           deletePrevious: true,
       },
       cron: coreTpl.CoreCron {
           backupSchedule: "@daily",
       },

    },
    mailConfig: coreTpl.CoreMail {
        sendgridApiKey: loadVar(prefixName="SYS_CORE", env="SENDGRID_API_KEY").val,
    },
};

std.manifestYamlDoc(cfg)