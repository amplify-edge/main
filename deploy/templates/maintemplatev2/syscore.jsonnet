local coreMixin = import "../../sys-core/service/go/template.syscore.libsonnet";
local loadVar = import "vendor/config/mixin.loadfn.libsonnet";

local cfg = {
    sysCoreConfig: {
       db: coreMixin.CoreDb {
           name: "gcn.db",
           encryptKey: loadVar(prefixName="SYS_CORE", env="DB_ENCRYPT_KEY").val,
           dbDir: "./db",
       },
       cron: coreMixin.CoreCron {
           backupSchedule: "@daily",
       }
    }
};

std.manifestYamlDoc(cfg)