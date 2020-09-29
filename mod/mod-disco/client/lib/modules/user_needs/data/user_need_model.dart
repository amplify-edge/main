import 'package:meta/meta.dart';

class UserNeed {
  final String id;

  final String prod;

  final String refOrgId;

  final String group;

  final String name;

  final String isTextBox;

  final String description;

  const UserNeed({
    @required this.id,
    @required this.prod,
    @required this.refOrgId,
    @required this.group,
    @required this.name,
    @required this.isTextBox,
    @required this.description,
  })  : assert(id != null),
        assert(prod != null),
        assert(refOrgId != null),
        assert(group != null),
        assert(name != null),
        assert(isTextBox != null),
        assert(description != null);
}
