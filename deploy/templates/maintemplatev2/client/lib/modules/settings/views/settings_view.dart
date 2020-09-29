

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'settings_view_web.dart';


class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ScreenTypeLayout.builder(
        desktop: (context) => SettingsViewWeb(),
        tablet: (context) => SettingsViewWeb(),
        mobile: (context) => SettingsViewWeb(),
      );
    
  }
}