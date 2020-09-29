import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/core.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/modules/support_roles/services/support_role_answer_service.dart';
import '../services/support_role_service.dart';
import '../data/support_role_model.dart';
import '../../orgs/service/orgs_service.dart';

class SupportRoleViewModel extends BaseModel {
  final supportRoleService = Modular.get<SupportRoleService>();
  final supportRoleAnswerService = Modular.get<SupportRoleAnswerService>();
  final orgService = Modular.get<OrgsService>();
  Org _org;

  Map<String, double> _minHours = {};

  List<SupportRole> get supportRoles => supportRoleService.getAll();
  Map<String, double> get minHours => _minHours;
  Org get org => _org;

  void selectMinHours(double value, String id) {
    _minHours[id] = value;
    notifyListeners();
  }

  fetchOrgById(String id) {
    setBuzy(true);
    _org = orgService.getOrgById(id);
    setBuzy(false);
  }

  void save() {
    this.minHours.forEach((key, value) {
      this.supportRoleAnswerService.repository.createSupportRoleAnswer(
            refQuestionId: key,
            refUserId: '199',
            answer: value.toString(),
            comment: 'N/A',
            prod: '1',
          );
    });
  }
}
