import 'dart:convert';
import 'package:bootstrapper/pkg/i18n/translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:sys_core/sys_core.dart';

String bootstrapTranslate(String key) {
  return BootstrapLocalizationsDelegate.instance.translate(key);
}

class BootstrapLocalizations extends Translations {
  final Locale locale;
  static Map<String, String> _localizedStrings;

  BootstrapLocalizations(this.locale);

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString(
        'packages/bootstrapper/i18n/lang_${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = Map.from(json.decode(jsonString))
      ..removeWhere((key, value) => key[0] == '@');

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }

  static BootstrapLocalizations of(BuildContext context) {
    return Localizations.of<BootstrapLocalizations>(
        context, BootstrapLocalizations);
  }
}

class BootstrapLocalizationsDelegate
    extends LocalizationsDelegate<BootstrapLocalizations> {
  // final Locale overriddenLocale;
  static BootstrapLocalizations instance;

  const BootstrapLocalizationsDelegate();

  @override
  bool shouldReload(BootstrapLocalizationsDelegate old) => true;

  @override
  bool isSupported(Locale locale) {
    return Languages.supportedLanguages.keys
        .contains(locale.languageCode.toString());
  }

  @override
  Future<BootstrapLocalizations> load(Locale locale) async {
    BootstrapLocalizations localizations = new BootstrapLocalizations(locale);
    await localizations.load();
    instance = localizations;
    return localizations;
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => Languages.supportedLanguages.keys
      .contains(locale.languageCode.toString());

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<_DefaultCupertinoLocalizations>(
          _DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);
}
