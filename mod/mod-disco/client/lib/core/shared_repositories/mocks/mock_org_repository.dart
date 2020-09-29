import 'package:mod_main/core/shared_repositories/base_repository.dart';
import 'package:mod_main/core/shared_repositories/org_repository.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';

class MockOrgRepository extends BaseRepository implements OrgRepository {
  @override
  List<Org> getAll() {
    return _mockOrgs;
  }

  Org getById(String id) {
    return _mockOrgs.singleWhere((_org) => _org.id == id);
  }

  List<Org> getByName(String name) {
    return _mockOrgs.where((_org) => _org.organization == name).toList();
  }

  // Because of the size of the data, I will put the attribute at the
  // bottom of the class
  static final List<Org> _mockOrgs = [
    Org(
      actionLength: "1",
      actionType: "NVDA",
      alreadyPledged: "29738",
      backingOrg: [
        "Org 1",
        "Org 2",
        "Org 3",
      ],
      campaignName: "NY State Pipeline Shutdown",
      campaignStill: "NY State Pipeline Shutdown",
      category: "Climate",
      contact: "climate@xr.org",
      crgIdsMany: [],
      crgQuantityMany: [],
      goal:
          "We will state a peaceful NVDA at the NYC Pipeline with the demand to have it shut down.",
      histPrecedents: "TBA",
      id: "001",
      logoUrl:
          "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2019/10/i-2-90414932-extinction-rebellion-symbol.jpg",
      minPioneers: "50",
      minRebelsForMedia: "5000",
      minRebelsToWin: "50,000",
      organization: "Extinction Rebellion XR",
      strategy: "TBA",
      uom: "Day",
      videoURL: [],
      actionLocation: "NYC Pipeline, NY, USA",
      actionTime: DateTime(2020, 4, 4, 11, 04),
    ),
    Org(
      actionLength: "1",
      actionType: "NVDA",
      alreadyPledged: "29738",
      backingOrg: [
        "Org 1",
        "Org 2",
        "Org 3",
      ],
      campaignName: "CA State Pipeline Shutdown",
      campaignStill: "CA State Pipeline Shutdown",
      category: "Climate",
      contact: "climate@xr.org",
      crgIdsMany: [],
      crgQuantityMany: [],
      goal:
          "We will state a peaceful NVDA at the Los Angeles Pipeline with the demand to have it shut down.",
      histPrecedents: "TBA",
      id: "002",
      logoUrl:
          "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2019/10/i-2-90414932-extinction-rebellion-symbol.jpg",
      minPioneers: "50",
      minRebelsForMedia: "5000",
      minRebelsToWin: "50,000",
      organization: "Extinction Rebellion XR",
      strategy: "TBA",
      uom: "Day",
      videoURL: [],
      actionLocation: "Los Angeles Pipeline, CA, USA",
      actionTime: DateTime(2020, 6, 4, 9, 0),
    ),
    Org(
      actionLength: "3",
      actionType: "NVDA",
      alreadyPledged: "45",
      backingOrg: [
        "Org 4",
        "Org 5",
        "Org 6",
      ],
      campaignName: "Porto Alegre Drilling Halt",
      campaignStill: "Porto Alegre Drilling Halt",
      category: "Climate",
      contact: "stopthedrilling@pasd.org",
      crgIdsMany: [],
      crgQuantityMany: [],
      goal: "We will have a peaceful marc hon the drilling sites in Brazil",
      histPrecedents: "TBA",
      id: "003",
      logoUrl:
          "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2019/10/i-2-90414932-extinction-rebellion-symbol.jpg",
      minPioneers: "50",
      minRebelsForMedia: "5000",
      minRebelsToWin: "50,000",
      organization: "ClimateBrazil",
      strategy: "TBA",
      uom: "Day",
      videoURL: [],
      actionLocation: "Porto Alegre Drilling Site, Proto ALegre, Brazil",
      actionTime: DateTime(2020, 8, 3, 14, 04),
    ),
    Org(
      actionLength: "1",
      actionType: "NVDA",
      alreadyPledged: "1232",
      backingOrg: [
        "Org 7",
        "Org 8",
        "Org 42",
      ],
      campaignName: "Manchester Factory Shutdown",
      campaignStill: "Manchester Factory Shutdown",
      category: "Climate",
      contact: "climate@mfs.org",
      crgIdsMany: [],
      crgQuantityMany: [],
      goal:
          "We will stage a peaceful at the Manchester rubber factory to get them to reduce their emissions.",
      histPrecedents: "TBA",
      id: "004",
      logoUrl:
          "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2019/10/i-2-90414932-extinction-rebellion-symbol.jpg",
      minPioneers: "50",
      minRebelsForMedia: "5000",
      minRebelsToWin: "50,000",
      organization: "Clean Air UK",
      strategy: "TBA",
      uom: "Week",
      videoURL: [],
      actionLocation: "KLA Rubber Plant, Manchester, UK",
      actionTime: DateTime(2020, 9, 15, 8, 0),
    ),
  ];
}
