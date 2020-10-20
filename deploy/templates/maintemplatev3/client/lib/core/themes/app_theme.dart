import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final overlayColor = const Color(0xff000000).withAlpha(150);

// #ff9705

ThemeData themeData = ThemeData(
    primaryColor: Color(hexColor('#90A4AE')),
    primaryColorDark: Color(hexColor('#62757f')),
    primaryColorLight: Color(hexColor('#c1d5e0')),
    accentColor: Color(hexColor('#546e7a')),
    scaffoldBackgroundColor: Color(hexColor('#ffffff')),
    splashColor: Color(hexColor('#ccc')),
    textTheme: TextTheme(
      headline1: TextStyle(color: Color(hexColor('000000')), fontSize: 20),
      headline2: TextStyle(color: Color(hexColor('000000')), fontSize: 24),
      headline3: TextStyle(color: Color(hexColor('000000')), fontSize: 32),
      headline4: TextStyle(color: Color(hexColor('000000')), fontSize: 20, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: Color(hexColor('000000')), fontSize: 24, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Color(hexColor('000000')), fontSize: 32, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: Color(hexColor('000000')), fontSize: 16,),
      bodyText2: TextStyle(color: Color(hexColor('000000')), fontSize: 16,fontWeight: FontWeight.bold),
      button: TextStyle(color: Color(hexColor('ffffff')), fontSize: 16, fontWeight: FontWeight.bold),
      subtitle1:  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300)
    ));

LinearGradient gradientHome = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(hexColor('f2f2f2')),
      Color(hexColor('c096ca')),
    ]);

LinearGradient gradient3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      themeData.primaryColorLight,
      themeData.primaryColor,
      themeData.primaryColorDark,
    ]);

LinearGradient gradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      themeData.primaryColorLight,
      themeData.primaryColor,
    ]);

hexColor(String hexCode) {
  String colorst = '0xff' + hexCode.replaceAll('#', '');
  int color = int.parse(colorst);
  return color;
}
