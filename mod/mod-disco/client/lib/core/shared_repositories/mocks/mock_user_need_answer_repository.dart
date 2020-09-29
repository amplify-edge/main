import 'package:flutter/material.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';
import 'package:mod_main/core/shared_repositories/user_need_answer_repository.dart';
import 'package:mod_main/modules/user_needs/data/user_need_answer_model.dart';

class MockUserNeedAnswerRepository extends BaseRepository
    implements UserNeedAnswerRepository {
  @override
  List<UserNeedAnswer> getAll() {
    return _mockUserNeedAnswers;
  }

  UserNeedAnswer getById(String id) {
    return
        _mockUserNeedAnswers
        .singleWhere((_userNeedAnswer) => _userNeedAnswer.id == id);
  }

  List<UserNeedAnswer> getByQuestionId(String questionId) {
    return
        _mockUserNeedAnswers
        .where((_userNeedAnswer) => _userNeedAnswer.refQuestionId == questionId)
        .toList();
  }

  bool createUserNeedAnswer(
      {@required String prod,
      @required String refQuestionId,
      @required String refUserId,
      @required String answer,
      @required String comment}) {

    UserNeedAnswer largestId = _mockUserNeedAnswers.reduce((value,
            element) =>
        value = int.parse(value.id) > int.parse(element.id) ? value : element);

    String newId = (int.parse(largestId.id) + 1).toString().padLeft(2, '0');

    UserNeedAnswer userNeedAnswer = UserNeedAnswer(
        id: newId,
        prod: prod,
        answer: answer,
        comment: comment,
        refQuestionId: refQuestionId,
        refUserId: refUserId);

    _mockUserNeedAnswers.add(userNeedAnswer);

    return true;
  }

  bool updateUserNeedAnswer(UserNeedAnswer userNeedAnswer) {
    int index =
        _mockUserNeedAnswers
        .indexWhere((_una) => _una.id == userNeedAnswer.id ? true : false);

    if (index < 0) {
      _mockUserNeedAnswers[index] = userNeedAnswer;

      return true;
    }

    return false;
  }

  // Because of the size of the data, I will put the attribute at the
  // bottom of the class
  static final List<UserNeedAnswer> _mockUserNeedAnswers = [
    UserNeedAnswer(
      id: '001',
      prod: '1',
      refQuestionId: '001',
      refUserId: '001',
      answer: '1',
      comment:
          'I will commit to stop paying my rent once 5000 other people have also stopped paying their rent.',
    ),
    UserNeedAnswer(
      id: '002',
      prod: '1',
      refQuestionId: '002',
      refUserId: '001',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '003',
      prod: '1',
      refQuestionId: '003',
      refUserId: '001',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '004',
      prod: '1',
      refQuestionId: '004',
      refUserId: '001',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '005',
      prod: '1',
      refQuestionId: '005',
      refUserId: '001',
      answer: '',
      comment: '',
    ),
    UserNeedAnswer(
      id: '006',
      prod: '1',
      refQuestionId: '001',
      refUserId: '002',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '007',
      prod: '1',
      refQuestionId: '002',
      refUserId: '002',
      answer: '1',
      comment:
          'I will commit to stop paying my rent once 10000 other people have also stopped paying their rent.',
    ),
    UserNeedAnswer(
      id: '008',
      prod: '1',
      refQuestionId: '003',
      refUserId: '002',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '009',
      prod: '1',
      refQuestionId: '004',
      refUserId: '002',
      answer: '1',
      comment:
          'I need to be more confident that I will be able to recieve the necessary legal defence if I am evicted from my home as a consequence of the rent strike.',
    ),
    UserNeedAnswer(
      id: '010',
      prod: '1',
      refQuestionId: '005',
      refUserId: '002',
      answer: '',
      comment: '',
    ),
    UserNeedAnswer(
      id: '011',
      prod: '1',
      refQuestionId: '001',
      refUserId: '003',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '012',
      prod: '1',
      refQuestionId: '002',
      refUserId: '003',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '013',
      prod: '1',
      refQuestionId: '003',
      refUserId: '003',
      answer: '0',
      comment: '',
    ),
    UserNeedAnswer(
      id: '014',
      prod: '1',
      refQuestionId: '004',
      refUserId: '003',
      answer: '1',
      comment:
          'I need to be more confident that I will be able to recieve the necessary legal defence if I am evicted from my home as a consequence of the rent strike.',
    ),
    UserNeedAnswer(
      id: '015',
      prod: '1',
      refQuestionId: '005',
      refUserId: '003',
      answer: 'I am concerned about retaliation from the company.',
      comment: 'Please let us know if there are any other concerns',
    ),
  ];
}
