import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:clipboard/clipboard.dart';
import 'package:sys_core/sys_core.dart';

class FilePickerViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Uint8List _fileBytes;
  String _fileName = '';
  List<String> _allowedExtensions = [];

  FilePickerViewModel(List<String> allowedExtensions) {
    _allowedExtensions = allowedExtensions;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Uint8List get fileBytes => _fileBytes;

  String get fileName => _fileName;

  Future<void> pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
      // allowMultiple: false,
    );
    if (result != null) {
      final _res = result.files.single;
      print("FILE BYTES: ${_res.bytes}");
      _fileBytes = _res.bytes;
      _fileName = _res.name;
      notifyListeners();
    }
  }

  Function() copyFileBytes(BuildContext context) {
    return () {
      if (_fileBytes != null) {
        FlutterClipboard.copy(_fileBytes.toString());
        notify(
          context: context,
          message: "copied",
          error: false,
        );
      }
    };
  }
}
