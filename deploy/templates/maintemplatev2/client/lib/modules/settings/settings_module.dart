import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/core/core.dart';

import 'views/settings_view.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter(Paths.settings, child: (context, args) => SettingsView())];

  static Inject get to => Inject<SettingsModule>.of();
}
