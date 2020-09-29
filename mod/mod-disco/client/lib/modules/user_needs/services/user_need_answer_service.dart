import '../data/user_need_answer_model.dart';
import 'package:mod_main/core/shared_repositories/user_need_answer_repository.dart';

class UserNeedAnswerService {
  final UserNeedAnswerRepository _repository;

  UserNeedAnswerService({repository}) : this._repository = repository;

  UserNeedAnswerRepository get repository => this._repository;

  UserNeedAnswer getUserNeedAnswerById(String id) {
    return this._repository.getById(id);
  }

  List<UserNeedAnswer> getUserNeedAnswersByQuestionId(String questionId) {
    return this._repository.getByQuestionId(questionId);
  }

  List<UserNeedAnswer> getAll() {
    // TODO Pull data from go client
    return this._repository.getAll();
  }
}
