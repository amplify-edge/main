import 'package:mod_main/modules/support_roles/data/support_role_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';

class SupportRoleRepository extends BaseRepository {
  List<SupportRole> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return [];
  }

  SupportRole getById(String id) {
    return null;
  }

  // Returns a list of Orgs via a matching name
  List<SupportRole> getByOrgId(String orgId) {
    return [];
  }
}
