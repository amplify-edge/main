import 'package:bootstrapper/bootstrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/core/views/home_page.dart';
import 'package:maintemplatev2/main.dart';
import 'package:mod_disco/modules/mod_disco.dart';
import 'package:sys_share_sys_account_service/view/screens/verify_module.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';

import 'core/core.dart';
import 'core/routing/route_guard.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends MainModule {
  final String url;
  final String urlNative;
  final AuthNavViewModel authNavViewModel;

  AppModule({this.url, this.urlNative, this.authNavViewModel});

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => this.authNavViewModel ?? AuthNavViewModel(),
        ),
      ];

  // here will be the routes of your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Paths.base,
          child: (_, args) => RootPage(),
          transition: TransitionType.noTransition,
          // customTransition: noTransition,
          guards: [NavRailGuard()],
        ),
        ModuleRoute(
          Paths.superAdminRoute,
          module: BootstrapperModule(
            baseRoute: Paths.superAdminRoute,
            url: url,
          ),
          guards: [NavRailGuard()],
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModuleRoute(
          Paths.adminRoute,
          module: AdminDashboardModule(
            baseRoute: Paths.adminRoute,
          ),
          guards: [NavRailGuard()],
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModuleRoute(
          Paths.modDisco,
          module: MainAppModule(
            baseRoute: Paths.modDisco,
            url: url,
            urlNative: urlNative,
          ),
          guards: [NavRailGuard()],
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModuleRoute(
          Paths.sysAccount,
          module: VerifyModule(
            baseRoute: Paths.sysAccount,
            url: url,
          ),
          // guards: [NavRailGuard()],
          transition: TransitionType.custom,
          customTransition: noTransition,
        ),
        ModuleRoute(
          Paths.settings,
          module: SettingsModule(),
          transition: TransitionType.custom,
          customTransition: noTransition,
          guards: [NavRailGuard()],
        ),
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
