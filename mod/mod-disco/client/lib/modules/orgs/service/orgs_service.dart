import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/core/shared_repositories/org_repository.dart';

class OrgsService {
  final OrgRepository _repository;

  OrgsService({repository}): this._repository = repository;

  Org getOrgById(String id) {
    return this._repository.getById(id);
  }

  List<Org> getOrgsByName(String name) {
    return this._repository.getByName(name);
  }

  List<Org> getAll(){
    // TODO Pull data from go client
    return this._repository.getAll();
  }
}