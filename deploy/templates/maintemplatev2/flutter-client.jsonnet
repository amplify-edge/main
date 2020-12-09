local loadVar = import "vendor/github.com/getcouragenow/sys-share/sys-core/service/config/mixins/mixin.loadfn.libsonnet";

local cfg = {
   Locales:: [
        "en",
        "es",
        "de",
        "fr",
        "it",
        "ur",
   ],
   channel: loadVar(prefixName="FRONTEND", env="CHANNEL").val,
   url: loadVar(prefixName="FRONTEND", env="DOMAIN").val,
   url_native: loadVar(prefixName="FRONTEND", env="URL_NATIVE").val,
   githash: loadVar(prefixName="FRONTEND", env="GITHASH").val,
   flutter_channel: loadVar(prefixName="FRONTEND", env="FLUTTER_CHANNEL").val,
   locales: self.Locales,
};

std.manifestJson(cfg)