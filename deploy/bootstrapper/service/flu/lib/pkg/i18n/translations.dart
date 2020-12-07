import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  Locale locale;

  String listBootstrap() {
    return Intl.message(
      'List Bootstrap',
      name: 'listBootstrap',
      desc: 'List Bootstrap',
      locale: locale.toString(),
    );
  }

  String editBootstrap() {
    return Intl.message(
      'Edit Bootstrap',
      name: 'editBootstrap',
      desc: 'Edit Bootstrap',
      locale: locale.toString(),
    );
  }
}
