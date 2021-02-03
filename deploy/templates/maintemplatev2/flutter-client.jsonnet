local loadVar = import "vendor/github.com/amplify-cms/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
   Locales:: [
        "en",
        "es",
        "de",
        "fr",
        "it",
        "tr",
        "ur",
   ],
   channel: loadVar(prefixName="FRONTEND", env="RELEASE_CHANNEL").val,
   host: loadVar(prefixName="FRONTEND", env="HOST").val,
   port: loadVar(prefixName="FRONTEND", env="PORT").val,
   url: loadVar(prefixName="FRONTEND", env="URL_WEB").val,
   url_native: loadVar(prefixName="FRONTEND", env="URL_NATIVE").val,
   githash: loadVar(prefixName="FRONTEND", env="GITHASH").val,
   flutter_channel: loadVar(prefixName="FRONTEND", env="FLUTTER_CHANNEL").val,
   locales: self.Locales,
};

std.manifestJson(cfg)