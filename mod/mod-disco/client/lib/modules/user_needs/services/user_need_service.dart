import '../data/user_need_model.dart';
import 'package:mod_main/core/shared_repositories/user_need_repository.dart';

class UserNeedService {
  final UserNeedRepository _repository;

  UserNeedService({repository}) : this._repository = repository;

  UserNeed getUserNeedById(String id) {
    return this._repository.getById(id);
  }

  List<UserNeed> getUserNeedsByOrgId(String orgId) {
    return this._repository.getByOrgId(orgId);
  }

  List<dynamic> getGroupedUserNeedsByOrgId(String orgId) {
    List<List<UserNeed>> groupedUserNeeds = [];
    List<UserNeed> userNeeds = this.getUserNeedsByOrgId(orgId);
    // Get a deduped set of groupIds
    Set<String> groupIds = userNeeds.map((userNeed) => userNeed.group).toSet();
    
    groupIds.forEach((groupId) {
      groupedUserNeeds.add(
          userNeeds.where((userNeed) => userNeed.group == groupId).toList());
    });

    return groupedUserNeeds;
  }

  List<UserNeed> getAll() {
    // TODO Pull data from go client
    return this._repository.getAll();
  }
}
