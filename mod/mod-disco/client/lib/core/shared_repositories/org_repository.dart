import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';

class OrgRepository extends BaseRepository {
  List<Org> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return [];
  }

  Org getById(String id) {
    return null;
  }

  // Returns a list of Orgs via a matching name
  List<Org> getByName(String name) {
    return [];
  }
}
