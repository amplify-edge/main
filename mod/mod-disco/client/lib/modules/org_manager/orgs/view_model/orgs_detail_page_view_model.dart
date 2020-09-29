import 'package:mod_main/core/core.dart';
import 'package:mod_main/modules/org_manager/orgs/data/org_model.dart';

class OrgsViewModel extends BaseModel {
  // This all is to manage orgs, please change it to match the users data model.
  List<Org> _orgs = Org.mockOrgs;
  int _rowsPerPage = 10;
  int _firstRowIndex = 0;
  int _sortColumnIndex;
  bool _sortAscending = true;
  List<bool> _selected = List<bool>.generate(Org.mockOrgs.length, (index) => false);

  List<Org> get orgs => _orgs;

  List<String> get masterOrgNames => Org.mockMasterOrgsNames;

  int get rowsPerPage => _rowsPerPage;

  int get firstRowIndex => _firstRowIndex;

  int get sortColumnIndex => _sortColumnIndex;

  bool get sortAscending => _sortAscending;

  List<bool> get selected => _selected;

  void changeSelection(bool value, int index) {
    _selected[index] = value;
    notifyListeners();
  }

  setRowsPerPage(int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    notifyListeners();
  }

  void onSelectAll(bool value) {
    for (int i = 0; i < _selected.length; i++) {
      _selected[i] = value;
    }
    notifyListeners();
  }

  void handleNextPage() async {
    if (_firstRowIndex + _rowsPerPage >= Org.mockOrgs.length) {
      return;
    }
    _firstRowIndex += _rowsPerPage;
    notifyListeners();
  }

  void handlePrevPage() async {
    if (_firstRowIndex - rowsPerPage < 0) {
      _firstRowIndex = 0;
    } else {
      _firstRowIndex -= _rowsPerPage;
    }
    notifyListeners();
  }

  void sort<T>(Comparable<T> getField(Org d), int columnIndex, bool ascending) {
    _orgs.sort((Org a, Org b) {
      if (!ascending) {
        final Org c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });

    _sortColumnIndex = columnIndex;
    _sortAscending = ascending;

    notifyListeners();
  }
}
