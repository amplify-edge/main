import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/core/views/nav_rail.dart';
import 'package:sys_core/sys_core.dart';

import '../core.dart';

class NavigationLayout extends StatefulWidget {
  final Widget body;

  const NavigationLayout({Key key, this.body}) : super(key: key);

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String platform = "phone";
    if (isTablet(context)) platform = "tablet";
    if (isDesktop(context)) platform = "desktop";

    return MaterialNavigationRail(
      //rebuild here on every platform change
      //unique keys would lead to rerender on every pixel change when resizing
      // the window
      key: ValueKey(platform),
      currentIndex: _currentIndex,
      drawerHeader: Container(height: 74, child: Text("")),
      body: widget.body,
      bottomNavigationBarSelectedColor:
          (Theme.of(context).brightness == Brightness.dark)
              ? Colors.tealAccent[200]
              : Theme.of(context).primaryColor,
      bottomNavigationBarUnselectedColor: Colors.grey,
      tabs: [
        TabItem(
          title: Text(
            AppLocalizations.of(context).tabhome(),
          ),
          icon: Icon(Icons.home),
          onTap: () {
            Modular.to.pushNamed(Paths.modDisco);
            print("Home tapped");
          },
        ),
        TabItem(
          title: Text(AppLocalizations.of(context).tabKanban()),
          icon: Icon(Icons.storage),
          onTap: () {
            Modular.to.pushNamed(Paths.modKanban);
            print("Kanban tapped");
          },
        ),
        TabItem(
          title: Text(AppLocalizations.of(context).tabchat()),
          icon: Icon(Icons.chat),
          onTap: () {
            Modular.to.pushNamed(Paths.chat);
            print("Chat tapped");
          },
        ),
        /*
        TabItem(
          title: Text(AppLocalizations.of(context).tabchat() + ' Beta'),
          icon: Icon(Icons.chat),
          onTap: () {
            Modular.to.pushNamed(Paths.chat_beta);
            print("ChatBeta tapped");
          },
        ), */
        TabItem(
          title: Text(AppLocalizations.of(context).tabIon()),
          icon: Icon(Icons.video_call),
          onTap: () {
            Modular.to.pushNamed(Paths.ion);
            print("ION tapped");
          },
        ),
        TabItem(
          title: Text(AppLocalizations.of(context).tabwriter()),
          icon: Icon(Icons.font_download),
          onTap: () {
            Modular.to.pushNamed(Paths.modWriter);
            print("Writer tapped");
          },
        ),
        TabItem(
          title: Text(AppLocalizations.of(context).tabmap()),
          icon: Icon(Icons.map),
          onTap: () {
            Modular.to.pushNamed(Paths.modGeo);
            print("Writer tapped");
          },
        ),
        TabItem(
          title: Text(AppLocalizations.of(context).tabsettings()),
          icon: Icon(Icons.settings),
          onTap: () {
            Modular.to.pushNamed(Paths.settings);
            print("Settings tapped");
          },
        ),
        // TabItem(
        //   title: Text("ModWriter"),
        //   icon: Icon(Icons.font_download),
        //   onTap: () {
        //     //  Navigator.of(context).pushNamed(ModularRouter.writer);
        //     // locator<NavigationService>().navigateTo(ModularRouter.writer);
        //     Modular.to.pushNamed(Paths.modWriter);
        //     print("ModWriter tapped");},
        // ),
      ],
      onPressed: (index) {
        print(index);
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
