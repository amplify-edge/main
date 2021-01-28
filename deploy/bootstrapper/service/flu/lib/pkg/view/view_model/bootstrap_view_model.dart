import 'package:bootstrapper/bootstrapper.dart';
import 'package:bootstrapper/pkg/shared_repositories/bootstrap_repo.dart';
import 'package:fixnum/fixnum.dart';
import 'package:sys_share_sys_account_service/pkg/shared_services/base_model.dart';

class BootstrapViewModel extends BaseModel {
  String _errMsg = '';
  Int64 currentPageId = Int64.ZERO;
  bool _isLoading = false;
  List<BS> _bootstrapList = List<BS>.empty(growable: true);
  String _activeId = '';

  BootstrapViewModel(List<BS> bsList) {
    if (bsList != null && bsList.isNotEmpty) {
      _bootstrapList = bsList;
      bsList.forEach((bs) {
        if (bs.isCurrentlyActive) {
          _activeId = bs.fileId;
        }
      });
      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;

  String get activeId => _activeId;

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
      res.bootstraps.forEach((bs) {
        if (bs.isCurrentlyActive) {
          _activeId = bs.fileId;
        }
      });
    }).catchError((e) {
      throw e;
    });
    setLoading(false);
  }

  Future<void> refreshBootstrapList() async {
    _bootstrapList.clear();
    await fetchBootstraps();
    notifyListeners();
  }
}
