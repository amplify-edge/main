import 'package:meta/meta.dart';

class SupportRole {
  // final Id<Roles> id;
  final String id;

  final String description;

  final String comment;

  //final bool mandatory;

  final String name;

  final String uom;

  final String prod;

  final String refOrgId;

  const SupportRole({
    @required this.id,
    @required this.name,
    @required this.comment,
    @required this.refOrgId,
    @required this.description,
    @required this.uom,
    @required this.prod,
  })  : assert(id != null),
        assert(name != null),
        assert(comment != null),
        assert(refOrgId != null),
        assert(description != null),
        assert(prod != null),
        assert(uom != null);
}
