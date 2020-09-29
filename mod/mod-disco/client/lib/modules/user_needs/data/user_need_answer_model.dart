import 'package:meta/meta.dart';

class UserNeedAnswer {
  final String id;

  final String prod;

  final String refQuestionId;

  final String refUserId;

  final String answer;

  final String comment;

  const UserNeedAnswer({
    @required this.id,
    @required this.prod,
    @required this.refQuestionId,
    @required this.refUserId,
    @required this.answer,
    @required this.comment,
  })  : assert(id != null),
        assert(prod != null),
        assert(refQuestionId != null),
        assert(refUserId != null),
        assert(answer != null),
        assert(comment != null);
}
