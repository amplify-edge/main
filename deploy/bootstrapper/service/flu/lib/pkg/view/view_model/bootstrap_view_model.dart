import 'package:bootstrapper/bootstrapper.dart';
import 'package:bootstrapper/pkg/shared_repositories/bootstrap_repo.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/account_repo.dart';
import 'package:sys_share_sys_account_service/pkg/shared_repositories/auth_repo.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart';

class BootstrapViewModel extends ChangeNotifier {
  Account _currentAccount = Account();
  Map<int, UserRoles> _mapRoles = Map<int, UserRoles>();
  String _accountId = '';
  String _errMsg = '';
  Int64 currentPageId = Int64.ZERO;
  bool _isUserSuperuser = false;
  bool _isUserLoggedIn = false;
  bool _isLoading = false;
  List<BS> _bootstrapList;

  bool get isUserSuperuser => _isUserSuperuser;

  bool get isUserLoggedIn => _isUserLoggedIn;

  bool get isLoading => _isLoading;

  List<BS> get bootstrapList => _bootstrapList;

  void _setSuperUser(bool value) {
    _isUserSuperuser = value;
    notifyListeners();
  }

  Future<void> _isLoggedIn() async {
    final isLoggedOn = await isLoggedIn();
    _isUserLoggedIn = isLoggedOn;
    notifyListeners();
  }

  void _setAccountId(String value) {
    _accountId = value;
    notifyListeners();
  }

  void _setCurrentAccount(Account account) {
    _currentAccount = account;
    notifyListeners();
  }

  Future<void> _fetchCurrentAccount() async {
    final currentUser = await UserRepo.getAccount(id: _accountId);
    _setCurrentAccount(currentUser);
  }

  Future<void> _fetchAccountId() async {
    if (_accountId.isEmpty) {
      final accountId = await getAccountId();
      _setAccountId(accountId);
      await _fetchCurrentAccount();
      if (_currentAccount.id.isNotEmpty) {
        _setAccountId(_currentAccount.id);
      }
    }
  }

  Future<void> verifySuperuser() async {
    if (_isUserLoggedIn) {
      await _fetchAccountId();
      final _isSuperAdmin = isSuperAdmin(_currentAccount);
      if (_isSuperAdmin) {
        _setSuperUser(true);
      }
    }
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> getPermissions() async {
    setLoading(true);
    await _isLoggedIn();
    if (!_isUserLoggedIn) {
      throw "cannot access dashboard, user not logged in";
    }
    if (_currentAccount.id.isEmpty) {
      await _fetchAccountId();
    }
    await verifySuperuser();
    if (!_isUserSuperuser) {
      throw "cannot access admin page, user is not authorized";
    }
    setLoading(false);
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
}
