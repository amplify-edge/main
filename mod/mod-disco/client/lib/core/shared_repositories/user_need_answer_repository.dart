import 'package:mod_main/modules/user_needs/data/user_need_answer_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';
import 'package:mod_main/modules/user_needs/data/user_need_model.dart';

class UserNeedAnswerRepository extends BaseRepository {
  List<UserNeedAnswer> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return [];
  }

  UserNeedAnswer getById(String id) {
    return null;
  }

  // Returns a list of Orgs via a matching name
  List<UserNeedAnswer> getByQuestionId(String questionId) {
    return [];
  }

  bool updateUserNeedAnswer(UserNeedAnswer userNeedAnswer) {}

  bool createUserNeedAnswer(
      {String prod,
      String refQuestionId,
      String refUserId,
      String answer,
      String comment}) {}
}
