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

  String execute() {
    return Intl.message(
      'Execute',
      name: 'execute',
      desc: 'Execute current bootstrap file',
      locale: locale.toString(),
    );
  }

  String executeBootstrap() {
    return Intl.message(
      'Execute Bootstrap',
      name: 'executeBootstrap',
      desc: 'Execute current bootstrap file',
      locale: locale.toString(),
    );
  }

  String delete() {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Delete current bootstrap file',
      locale: locale.toString(),
    );
  }

  String deleteBootstrap() {
    return Intl.message(
      'Delete Bootstrap',
      name: 'deleteBootstrap',
      desc: 'Delete current bootstrap file',
      locale: locale.toString(),
    );
  }

  String cancel() {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel',
      locale: locale.toString(),
    );
  }

  String confirm() {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm',
      locale: locale.toString(),
    );
  }

  String allOfYourDataWillBeDeleted() {
    return Intl.message(
      'All of your data will be deleted!',
      name: 'allOfYourDataWillBeDeleted',
      desc: 'Execute bootstrap dialog alert box',
      locale: locale.toString(),
    );
  }

  String bootstrapFileWillBeDeleted() {
    return Intl.message(
      'Bootstrap file will be deleted!',
      name: 'bootstrapFileWillBeDeleted',
      desc: 'Delete bootstrap dialog alert box',
      locale: locale.toString(),
    );
  }

  String pickImageAndCopyTheResultingValue() {
    return Intl.message(
      'Pick image and copy the resulting value',
      name: 'pickImageAndCopyTheResultingValue',
      desc: 'For Image / File Picker',
      locale: locale.toString(),
    );
  }
}
