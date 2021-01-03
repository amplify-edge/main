import 'package:bootstrapper/bootstrapper.dart';
import 'package:bootstrapper/pkg/shared_repositories/bootstrap_repo.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';

class BootstrapViewModel extends ChangeNotifier {
  String _errMsg = '';
  Int64 currentPageId = Int64.ZERO;
  bool _isLoading = false;
  List<BS> _bootstrapList;

  bool get isLoading => _isLoading;

  List<BS> get bootstrapList => _bootstrapList;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> fetchBootstraps() async {
    setLoading(true);
    await BootstrapRepo.listBootstrap().then((res) {
      if (_bootstrapList == null || _bootstrapList.isEmpty) {
        _bootstrapList = res.bootstraps;
      }
    }).catchError((e) {
      throw e;
    });
    setLoading(false);
  }

  Future<void> refreshBootstrapList() async {
    _bootstrapList.clear();
    await fetchBootstraps();
  }
}
