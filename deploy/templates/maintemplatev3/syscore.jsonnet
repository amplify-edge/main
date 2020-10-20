local coreTpl = import "vendor/github.com/getcouragenow/sys/sys-core/service/go/template.syscore.libsonnet";
local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixin.loadfn.libsonnet";

local cfg = {
    sysCoreConfig: {
       db: coreTpl.CoreDb {
           name: "gcn.db",
           encryptKey: loadVar(prefixName="SYS_CORE", env="DB_ENCRYPT_KEY").val,
           dbDir: "./db",
       },
       cron: coreTpl.CoreCron {
           backupSchedule: "@daily",
       }
    }
};

std.manifestYamlDoc(cfg)