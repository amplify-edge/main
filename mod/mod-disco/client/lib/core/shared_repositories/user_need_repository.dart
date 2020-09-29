import 'package:mod_main/modules/user_needs/data/user_need_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';

class UserNeedRepository extends BaseRepository {
  List<UserNeed> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return [];
  }

  UserNeed getById(String id) {
    return null;
  }

  // Returns a list of Orgs via a matching name
  List<UserNeed> getByOrgId(String orgId) {
    return [];
  }
}
