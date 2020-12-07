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

  String noBootstraps() {
    return Intl.message(
      'No Bootstraps',
      name: 'noBootstraps',
      desc: 'No Bootstrap',
      locale: locale.toString(),
    );
  }

  String selectBootstrap() {
    return Intl.message(
      'Select Bootstrap',
      name: 'selectBootstrap',
      desc: 'Select Bootstrap',
      locale: locale.toString(),
    );
  }

  String bootstrapDetails() {
    return Intl.message(
      'Bootstrap Details',
      name: 'bootstrapDetails',
      desc: 'Bootstrap File Content and Name',
      locale: locale.toString(),
    );
  }
}
