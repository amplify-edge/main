import 'package:meta/meta.dart';

class SupportRoleAnswer {
  
  final String id;

  final String prod;

  final String refUserId;

  final String answer;

  final String refQuestionId;

  const SupportRoleAnswer({
    @required this.id,
    @required this.prod,
    @required this.refUserId,
    @required this.refQuestionId,
    @required this.answer
  })  : assert(id != null),
        assert(prod != null),
        assert(refUserId != null),
        assert(refQuestionId != null),
        assert(answer != null);
}
