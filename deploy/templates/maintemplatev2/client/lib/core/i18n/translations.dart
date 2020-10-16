import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  Locale locale;

  String tabhome() {
    return Intl.message(
      'Home',
      name: 'tabhome',
      desc: 'text for the home tab',
      locale: locale.toString(),
    );
  }

  String tabsurvey() {
    return Intl.message(
      'Survey',
      name: 'tabsurvey',
      desc: 'text for survey tab',
      locale: locale.toString(),
    );
  }

  String tabchat() {
    return Intl.message(
      'Chat',
      name: 'tabchat',
      desc: 'text for the chat tab',
      locale: locale.toString(),
    );
  }

  String tabIon() {
    return Intl.message(
      'Ion',
      name: 'tabIon',
      desc: 'text for the ion tab',
      locale: locale.toString(),
    );
  }

  String tabsettings() {
    return Intl.message(
      'Settings',
      name: 'tabsettings',
      desc: 'text for the settings tab',
      locale: locale.toString(),
    );
  }

  String tabwriter() {
    return Intl.message(
      'Writer',
      name: 'tabwriter',
      desc: 'text for the writer tab',
      locale: locale.toString(),
    );
  }

  String tabKanban() {
    return Intl.message(
      'Kanban',
      name: 'tabKanban',
      desc: 'Text for the Kanban tab',
      locale: locale.toString(),
    );
  }

  String tabmap() {
    return Intl.message(
      'Map',
      name: 'tabmap',
      desc: 'text for the writer tab',
      locale: locale.toString(),
    );
  }

  String tabSettings() {
    return Intl.message(
      'Settings',
      name: 'tabSettings',
      desc: 'text for the settings tab',
      locale: locale.toString(),
    );
  }

  String changeLanguageSet() {
    return Intl.message(
      'Change Language',
      name: 'changeLanguageSet',
      desc: 'text for the change language text in settings screen',
      locale: locale.toString(),
    );
  }

  String changeThemeSet() {
    return Intl.message(
      'Change Theme',
      name: 'changeThemeSet',
      desc: 'text for the change theme text in settings screen',
      locale: locale.toString(),
    );
  }
}
