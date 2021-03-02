import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'settings_view_web.dart';

class SettingsView extends StatelessWidget {
  // final Function onChangeLanguageCallback;

  // SettingsView({Key key, @required this.onChangeLanguageCallback});
  SettingsView({Key key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => SettingsViewWeb(
        key: key,
        // onChangeLanguageCallback: onChangeLanguageCallback,
      ),
      tablet: (context) => SettingsViewWeb(
        key: key,
        // onChangeLanguageCallback: onChangeLanguageCallback,
      ),
      mobile: (context) => SettingsViewWeb(
        key: key,
        // onChangeLanguageCallback: onChangeLanguageCallback,
      ),
    );
  }
}
