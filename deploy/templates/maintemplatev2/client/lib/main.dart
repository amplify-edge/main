import 'package:asuka/asuka.dart' as asuka;
import 'package:bootstrapper/pkg/i18n/bootstrap_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/app_module.dart';
import 'package:mod_disco/core/i18n/mod_disco_localization.dart';
import 'package:provider/provider.dart' as provider;
import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';
import 'package:hive/hive.dart';
// import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';

import '././core/core.dart';
import 'modules/settings/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // configureApp();

  // init settings view model before starting app
  await Hive.openBox('account');
  var settingsViewModel = SettingsViewModel();
  // final authNavViewModel = AuthNavViewModel();
  // get env.json from assets
  await settingsViewModel.fetchEnvVariables();

  runApp(
    provider.ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => settingsViewModel,
      child: ModularApp(
        module: AppModule(
          // not convinced if this is the right place to do this url config ...
          url: settingsViewModel.envVariables.url,
          urlNative: settingsViewModel.envVariables.urlNative,
        ),
        child: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = provider.Provider.of<SettingsViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          asuka.builder(context, NavigationLayout(body: child)),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: model.themeMode,
      localizationsDelegates: [
        AppLocalizationsDelegate(model.locale), //maintemplate delegate
        BootstrapLocalizationsDelegate(),
        SysCoreLocalizationsDelegate(),
        SysAccountLocalizationsDelegate(),
        ModDiscoLocalizationsDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      locale: (model.locale == Locale('en') ? null : model.locale),
      supportedLocales: Languages.getLocales(),
    ).modular();
  }
}
