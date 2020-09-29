import 'package:mod_main/core/shared_repositories/base_repository.dart';
import 'package:mod_main/core/shared_repositories/user_need_repository.dart';
import 'package:mod_main/modules/user_needs/data/user_need_model.dart';

class MockUserNeedRepository extends BaseRepository implements UserNeedRepository {
  @override
  List<UserNeed> getAll() {
    return _mockUserNeeds;
  }

  UserNeed getById(String id) {
    return _mockUserNeeds.singleWhere((_userNeed) => _userNeed.id == id);
  }

  List<UserNeed> getByOrgId(String orgId) {
    return _mockUserNeeds.where((_userNeed) => _userNeed.refOrgId == orgId).toList();
  }

  // Because of the size of the data, I will put the attribute at the
  // bottom of the class
  static final List<UserNeed> _mockUserNeeds = [
    UserNeed(
      id: '001',
      prod: '1',
      refOrgId: '001',
      group: '1',
      name: 'USER-DEMAND-RENT-5000',
      isTextBox: 'no',
      description: 'I will commit to stop paying my rent once 5000 other people have also stopped paying their rent.',
    ),
    UserNeed(
      id: '002',
      prod: '1',
      refOrgId: '001',
      group: '1',
      name: 'USER-DEMAND-RENT-10000',
      isTextBox: 'no',
      description: 'I will commit to stop paying my rent once 10000 other people have also stopped paying their rent.',
    ),
    UserNeed(
      id: '003',
      prod: '1',
      refOrgId: '001',
      group: '1',
      name: 'USER-DEMAND-RENT-15000',
      isTextBox: 'no',
      description: 'I will commit to stop paying my rent once 15000 other people have also stopped paying their rent.',
    ),
    UserNeed(
      id: '004',
      prod: '1',
      refOrgId: '001',
      group: '2',
      name: 'USER-DEMAND-LEGAL',
      isTextBox: 'no',
      description: 'I need to be more confident that I will be able to recieve the necessary legal defence if I am evicted from my home as a consequence of the rent strike.',
    ),
    UserNeed(
      id: '005',
      prod: '1',
      refOrgId: '004',
      group: '2',
      name: 'USER-DEMAND-LEGAL',
      isTextBox: 'no',
      description: 'I need to be more confident that I will be able to recieve the necessary legal defence if I am evicted from my home as a consequence of the rent strike.',
    ),
    UserNeed(
      id: '006',
      prod: '1',
      refOrgId: '001',
      group: '3',
      name: 'USER-DEMAND-LEGAL-OPEN',
      isTextBox: 'yes',
      description: 'Please let us know if there are any other concerns.',
    ),
    UserNeed(
      id: '007',
      prod: '1',
      refOrgId: '002',
      group: '3',
      name: 'USER-DEMAND-QUESTION-1',
      isTextBox: 'no',
      description: 'I am willing to participate if no matter what.',
    ),
    UserNeed(
      id: '008',
      prod: '1',
      refOrgId: '001',
      group: '12',
      name: 'USER-DEMAND-QUESTION-3',
      isTextBox: 'no',
      description: 'I am willing to participate if no matter what.',
    ),
  ];
}
