import '../data/support_role_answer_model.dart';
import 'package:mod_main/core/shared_repositories/support_role_answer_repository.dart';

class SupportRoleAnswerService {
  final SupportRoleAnswerRepository _repository;

  SupportRoleAnswerService({repository}): this._repository = repository;

  SupportRoleAnswerRepository get repository => this._repository;

  SupportRoleAnswer getSupportRoleAnswerById(String id) {
    return this._repository.getById(id);
  }

  List<SupportRoleAnswer> getSupportRoleAnswersByQuestionId(String questionId) {
    return this._repository.getByQuestionId(questionId);
  }

  List<SupportRoleAnswer> getAll(){
    // TODO Pull data from go client
    return this._repository.getAll();
  }
}
