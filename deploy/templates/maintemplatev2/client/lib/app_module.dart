import 'package:bootstrapper/bootstrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/main.dart';
import 'package:maintemplatev2/modules/startup/views/startup_view.dart';
// import 'package:mod_chat/mod_chat.dart';

//import 'package:mod_chat_beta/mod_chat.dart' as chatBeta;
// import 'package:mod_geo/mod_geo.dart';
// import 'package:mod_ion/ion_module.dart';
// import 'package:mod_kanban/kanban_module.dart';
import 'package:mod_disco/modules/mod_disco.dart';
import 'package:sys_share_sys_account_service/view/screens/verify_module.dart';

// import 'package:mod_session/mod_session.dart';
// import 'package:mod_write/mod_write.dart';
// import 'package:mod_write/writer_module.dart';
// import 'package:mod_account/modules/mod_account.dart';

import 'core/core.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends MainModule {
  final String url;
  final String urlNative;

  AppModule({this.url, this.urlNative});

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<ModularRouter> get routers => [
        // ModularRouter(Paths.startup,
        //     child: (context, args) => StartupView(),
        //     transition: TransitionType.fadeIn),
        // ModularRouter(Paths.login,
        //     child: (context, args) => LoginView(),
        //     transition: TransitionType.fadeIn),
        ModularRouter(
          Paths.adminRoute,
          module: BootstrapperModule(
            baseRoute: Paths.adminRoute,
            url: url,
          ),
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModularRouter(
          Paths.startup,
          child: (_, args) => StartupView(),
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        // ModularRouter(
        //   Paths.sysAccount,
        //   child: (_, args) => VerifyModule(),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        ModularRouter(
          Paths.modDisco,
          module: MainAppModule(
            baseRoute: Paths.modDisco,
            url: url,
            urlNative: urlNative,
          ),
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModularRouter(
          Paths.modDisco,
          module: VerifyModule(
            baseRoute: Paths.sysAccount,
            url: url,
          ),
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        // ModularRouter(
        //   Paths.sysAccount,
        //   module: AccountModule(
        //       tabs: [],
        //       navigatorKey: null,
        //       body: null
        //   ),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        // ModularRouter(
        //   Paths.chat,
        //   module: ChatModule(
        //     Paths.chat,
        //     deviceID: SessionModule.deviceID,
        //     url: url,
        //     urlNative: urlNative,
        //   ),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        // ModularRouter(
        //   Paths.ion,
        //   module: IonModule(
        //     Paths.ion,
        //     deviceID: SessionModule.deviceID,
        //     userAgent: SessionModule.deviceUserAgent,
        //   ),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        // //ModularRouter(Paths.chat_beta, module: chatBeta.ModChatModule()),
        // ModularRouter(
        //   Paths.modWriter,
        //   module: ModWriterModule(Paths.modWriter),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        // ModularRouter(
        //   Paths.modGeo,
        //   module: GeoModule(Paths.modGeo),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
        ModularRouter(
          Paths.settings,
          module: SettingsModule(),
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        // ModularRouter(
        //   Paths.modKanban,
        //   module: KanbanModule(Paths.modKanban),
        //   transition: TransitionType.custom,
        //   customTransition: noTransition,
        // ),
      ];

// add your main widget here
  @override
  Widget get bootstrap => App();

  CustomTransition get noTransition => CustomTransition(
        transitionDuration: Duration.zero,
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      );
}
