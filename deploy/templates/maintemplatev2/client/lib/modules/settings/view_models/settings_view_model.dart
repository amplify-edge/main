import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sys_core/sys_core.dart';

class SettingsViewModel extends ChangeNotifier {
  // final SettingsRepository settingsRepository;

  // SettingsViewModel({@required this.settingsRepository});
  HostConfig _envVariables = HostConfig.empty();

  HostConfig get envVariables => _envVariables;

  Future<void> fetchEnvVariables() async {
    //String data =
    //await DefaultAssetBundle.of(context).loadString("assets/env.json");
    String data = await rootBundle.loadString("assets/env.json");

    _envVariables = HostConfig.fromJsonString(data);

    this.loadLocalesFromEnvVariables(_envVariables);

    notifyListeners();
  }

  void loadLocalesFromEnvVariables(HostConfig _envVariables) {
    this.supportedLocales = _envVariables.locales;
    this._locale = _envVariables.locales.first;
  }

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = Locale('en');
  List<Locale> supportedLocales = Languages.getLocales();

  Locale get locale => _locale;

  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }

  void changeLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  String languageNameLookup(Locale locale) {
    String code = locale.languageCode.toString();

    if (Languages.supportedLanguages.containsKey(code)) {
      return Languages.supportedLanguages[code];
    }

    return 'Unknown';
  }
}
