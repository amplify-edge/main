import '../data/support_role_model.dart';
import 'package:mod_main/core/shared_repositories/support_role_repository.dart';

class SupportRoleService {
  final SupportRoleRepository _repository;

  SupportRoleService({repository}): this._repository = repository;

  SupportRole getSupportRoleById(String id) {
    return this._repository.getById(id);
  }

  List<SupportRole> getSupportRolesByOrgId(String orgId) {
    return this._repository.getByOrgId(orgId);
  }

  List<SupportRole> getAll(){
    // TODO Pull data from go client
    return this._repository.getAll();
  }
}
