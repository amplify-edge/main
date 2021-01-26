import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sys_share_sys_account_service/view/widgets/auth_nav_layout.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';

import '../core.dart';

class NavigationLayout extends StatefulWidget {
  final Widget body;

  const NavigationLayout({Key key, this.body}) : super(key: key);

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => AuthNavLayout(
          body: widget.body,
          adminTabs: LinkedHashMap.of(<String, TabItem>{
            Paths.adminRoute: TabItem(
              title: Text(
                AppLocalizations.of(context).tabadmin(),
                style: TextStyle(fontSize: 12),
              ),
              icon: Icon(Icons.dashboard, size: 30),
              onTap: () {
                Modular.to.navigate(Paths.adminRoute);
              },
            ),
          }),
          superAdminTabs: LinkedHashMap.of(<String, TabItem>{
            Paths.superAdminRoute: TabItem(
              title: Text(
                AppLocalizations.of(context).tabSuper(),
                style: TextStyle(fontSize: 12),
              ),
              icon: Icon(Icons.people, size: 30),
              onTap: () {
                Modular.to.navigate(Paths.superAdminRoute);
              },
            ),
          }),
          tabs: LinkedHashMap.of(<String, Widget>{
            Paths.modDisco: TabItem(
              title: Text(
                AppLocalizations.of(context).tabhome(),
                style: TextStyle(fontSize: 12),
              ),
              icon: Icon(Icons.home, size: 30),
              onTap: () {
                Modular.to.navigate(Paths.modDisco);
              },
            ),
            Paths.settings: TabItem(
              title: Text(
                AppLocalizations.of(context).tabsettings(),
                style: TextStyle(fontSize: 12),
              ),
              icon: Icon(Icons.settings, size: 30),
              onTap: () {
                Modular.to.navigate(Paths.settings);
              },
            ),
          }),
        ),
      ),
    );
  }
}
