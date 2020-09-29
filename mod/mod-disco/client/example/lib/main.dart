import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/core.dart';

import 'package:mod_main/modules/main_module.dart';
import 'package:sys_core/sys_core.dart';

void main() {
  runApp(ModularApp(module: AppModule()));
}

class LanguageNotifier extends ChangeNotifier {
  Locale locale = Locale("en", "en");

  setLocale(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => LanguageNotifier())];

  @override
  Widget get bootstrap => App();

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/",
            module: MainAppModule(
                baseRoute: '/',
                url: "http://[::1]:61146/#",
                urlNative: "http://[::1]:61146/#")),
      ];
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageNotifier>(builder: (context, value) {
      print("value: ${value.locale}");
      return MaterialApp(
          builder: (context, child) => Column(
                children: <Widget>[
                  Expanded(child: child),
                  Row(
                    children: <Widget>[
                      ...Languages.supportedLanguages.keys
                          .map((e) => RaisedButton(
                                child: Text(e),
                                onPressed: () => value.setLocale(Locale(e)),
                              ))
                          .toList(),
                    ],
                  ),
                ],
              ),
          locale: value.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.navigatorKey,
          supportedLocales:
              Languages.supportedLanguages.keys.map((e) => Locale(e)).toList(),
          localizationsDelegates: [
            ModMainLocalizationsDelegate(value.locale),
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ]);
    });
  }
}
