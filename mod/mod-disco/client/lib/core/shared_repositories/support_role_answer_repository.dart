import 'package:flutter/material.dart';
import 'package:mod_main/modules/support_roles/data/support_role_answer_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';

class SupportRoleAnswerRepository extends BaseRepository {
  List<SupportRoleAnswer> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return [];
  }

  SupportRoleAnswer getById(String id) {
    return null;
  }

  // Returns a list of Orgs via a matching name
  List<SupportRoleAnswer> getByQuestionId(String questionId) {
    return [];
  }

   bool createSupportRoleAnswer(
      {@required String prod,
      @required String refQuestionId,
      @required String refUserId,
      @required String answer,
      @required String comment}) {}

    bool updateSupportRoleAnswer(SupportRoleAnswer supportRoleAnswer) {}

}
