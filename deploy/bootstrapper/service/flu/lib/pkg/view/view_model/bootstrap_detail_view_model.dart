import 'package:bootstrapper/pkg/i18n/bootstrap_localization.dart';
import 'package:bootstrapper/pkg/shared_repositories/bootstrap_repo.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BootstrapDetailViewModel extends ChangeNotifier {
  String _fileContent = '';
  String _fileId = '';
  String _errMsg = '';
  bool _isLoading = false;
  bool _isSaving = false;
  bool _isUploading = false;
  FileEditor _fileEditor;

  bool get isLoading => _isLoading;

  bool get isSaving => _isSaving;

  bool get isUploading => _isUploading;

  String get fileContent => _fileContent;

  String get errMsg => _errMsg;

  // constructor
  BootstrapDetailViewModel({@required String id}) {
    _setFileId(id);
  }

  void _setFileId(String val) {
    _fileId = val;
    notifyListeners();
  }

  void _setFileEditor(FileEditor val) {
    _fileEditor = val;
    notifyListeners();
  }

  void _setFileContent(String val) {
    _fileContent = val;
    notifyListeners();
  }

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void _setIsSaving(bool val) {
    _isSaving = val;
    notifyListeners();
  }

  void _setIsUploading(bool val) {
    _isUploading = val;
    notifyListeners();
  }

  void _setErrMsg(String val) {
    _errMsg = val;
    notifyListeners();
  }

  Future<void> fetchCurrentBootstrap() async {
    _setLoading(true);
    await BootstrapRepo.getBootstrap(bsId: _fileId).then((resp) {
      final fileContent = resp.content.toString();
      print("FILECONTENT: $fileContent");
      _setFileEditor(
        FileEditor(
          name: resp.fileId.split('.').first,
          language: 'json',
          code: fileContent,
        ),
      );
    }).catchError((e) {
      _setErrMsg(e.toString());
    });
    _setLoading(false);
  }

  EditorModel getEditorModel() {
    return EditorModel(
      files: [_fileEditor],
    );
  }

  Function() onExecuteBootstrap(BuildContext context, String id) {
    return () async {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(BootstrapLocalizations.of(context)
                .executeBootstrap()),
            content: Text(BootstrapLocalizations.of(context)
                .translate('allOfYourDataWillBeDeleted')),
            actions: <Widget>[
              FlatButton(
                child: Text(
                    BootstrapLocalizations.of(context).confirm()),
                color: Colors.green.shade500,
                textColor: Colors.white,
                onPressed: () async {
                  _setLoading(true);
                  await BootstrapRepo.executeBootstrap(bsId: id)
                      .then((_) => {_setLoading(false)})
                      .catchError((e) {
                    _setLoading(false);
                    _setErrMsg("error deleting bootstrap");
                  });
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              FlatButton(
                child: Text(
                    BootstrapLocalizations.of(context).cancel()),
                color: Colors.red.shade500,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    };
  }

  Function() onDeleteBootstrap(
      BuildContext context, String id, Function deleteCallback) {
    return () async {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(BootstrapLocalizations.of(context)
                .translate('deleteBootstrap')),
            content: Text(BootstrapLocalizations.of(context)
                .translate('bootstrapFileWillBeDeleted')),
            actions: <Widget>[
              FlatButton(
                child: Text(
                    BootstrapLocalizations.of(context).translate('confirm')),
                color: Colors.green.shade500,
                textColor: Colors.white,
                onPressed: () async {
                  _setLoading(true);
                  await BootstrapRepo.deleteBootstrap(bsId: id).then((_) {
                    deleteCallback();
                    _setLoading(false);
                  }).catchError((e) {
                    _setLoading(false);
                    _setErrMsg("error executing bootstrap");
                  });
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              FlatButton(
                child: Text(
                    BootstrapLocalizations.of(context).translate('cancel')),
                color: Colors.red.shade500,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    };
  }

  void onSubmit(String lang, String content) {
    // TODO
  }
}
