import 'package:mod_main/modules/support_roles/data/support_role_model.dart';
import 'package:mod_main/core/shared_repositories/base_repository.dart';
import 'package:mod_main/core/shared_repositories/support_role_repository.dart';

class MockSupportRoleRepository extends BaseRepository
    implements SupportRoleRepository {
  List<SupportRole> getAll() {
    // Might look something like this
    // this.getConnection().query("SELECT * FROM xorgs");
    // OR if the client acts as the repository, then this repo will just mirror it
    // and do this.getConnection().getAllOrgs()

    return _mockSupportRoles;
  }

  SupportRole getById(String id) {
    return _mockSupportRoles.singleWhere((_supportRole) => _supportRole.id == id);
  }

  // Returns a list of Orgs via a matching name
  List<SupportRole> getByOrgId(String orgId) {
    return _mockSupportRoles.where((_supportRole) => _supportRole.refOrgId == orgId).toList();
  }

  static List<SupportRole> _mockSupportRoles = [
    SupportRole(
      id: "001",
      name: "Lawyer",
      comment: "",
      refOrgId: "001",
      description:
          "Provide legal advice and support to NVDA volunteers and leaders before, during, and after their interaction with police and the justice system. Law students and paralegls are also welcome",
      uom: "Hour(s)",
      prod: "0",
    ),
    SupportRole(
      id: "002",
      name: "Social Media",
      comment: "",
      refOrgId: "001",
      description:
          "Provide social media help (e.g., advertise the event on social media. Are you an influencer or microinfluencer? Do you know how to get peoples attention on social media? This role could be for you!",
      uom: "Hour(s)",
      prod: "0",
    ),
    SupportRole(
      id: "003",
      name: "Doctor",
      comment: "",
      refOrgId: "002",
      description:
          "I can provide aid to protesters due to the long days, heat stroke and dehydration are real issues.",
      uom: "Hour(s)",
      prod: "0",
    ),
    SupportRole(
      id: "004",
      name: "Lawyer",
      comment: "",
      refOrgId: "003",
      description:
          "Provide legal advice and support to NVDA volunteers and leaders before, during, and after their interaction with police and the justice system. Law students and paralegls are also welcome",
      uom: "Hour(s)",
      prod: "0",
    ),
    SupportRole(
      id: "005",
      name: "Lawyer",
      comment: "",
      refOrgId: "004",
      description:
          "Provide legal advice and support to NVDA volunteers and leaders before, during, and after their interaction with police and the justice system. Law students and paralegls are also welcome",
      uom: "Hour(s)",
      prod: "0",
    ),
  ];
}
