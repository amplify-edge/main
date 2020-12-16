import 'package:flutter/material.dart';
import 'package:maintemplatev2/core/core.dart';
import 'package:maintemplatev2/modules/settings/view_models/settings_view_model.dart';
import 'package:provider/provider.dart';

class SettingsViewWeb extends StatelessWidget {
  SettingsViewWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsViewModel>(context);
    final env = model.envVariables;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tabSettings()),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text(AppLocalizations.of(context).changeThemeSet()),
            trailing: DropdownButton<ThemeMode>(
              value: model.themeMode,
              onChanged: (ThemeMode value) {
                model.changeTheme(value);
              },
              items: ThemeMode.values
                  .map<DropdownMenuItem<ThemeMode>>((ThemeMode value) {
                return DropdownMenuItem<ThemeMode>(
                  value: value,
                  child: Text(
                      value.toString().replaceAll(RegExp(r'ThemeMode.'), '')),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(AppLocalizations.of(context).changeLanguageSet()),
            trailing: DropdownButton<Locale>(
              value: model.locale,
              onChanged: (Locale value) {
                model.changeLanguage(value);
              },
              items: model.supportedLocales
                  .map<DropdownMenuItem<Locale>>((Locale value) {
                return DropdownMenuItem<Locale>(
                  value: value,
                  child: Text(model.languageNameLookup(value)),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text("Channel"),
            subtitle: Text(env.releaseChannel),
          ),
          // ListTile(
          //   title: Text("Url"),
          //   subtitle: Text(env.url),
          // ),
          // ListTile(
          //   title: Text("UrlNative"),
          //   subtitle: Text(env.urlNative),
          // ),
          ListTile(
            title: Text("GitHash"),
            subtitle: Text(env.githash),
          ),
          ListTile(
            title: Text("Host"),
            subtitle: Text("${env.host}:${env.port}"),
          ),
          ListTile(
            title: Text("Flutter channel"),
            subtitle: Text(env.flutterChannel),

          ),
        ]),
      ),
    );
  }
}
