import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'settings_view_web.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => SettingsViewWeb(key: key),
      tablet: (context) => SettingsViewWeb(key: key),
      mobile: (context) => SettingsViewWeb(key: key),
    );
  }
}
