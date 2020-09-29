import 'dart:math';

import 'package:meta/meta.dart';
import 'package:random_string/random_string.dart';

class Org {
  // final Id<Campaign> id;

  final String id;

  final String campaignName;

  final String logoUrl;

  final String goal;

  final List<String> crgQuantityMany;

  final List<String> crgIdsMany;

  final String alreadyPledged;

  final DateTime actionTime;

  final String actionLocation;

  final String campaignStill;

  final String minPioneers;

  final String minRebelsForMedia;

  final String minRebelsToWin;

  final String actionLength;

  final String actionType;

  final List<String> backingOrg;

  final String category;

  final String contact;

  final String histPrecedents;

  final String organization;

  final String strategy;

  final List<String> videoURL;

  final String uom;

  const Org({
    @required this.actionLength,
    @required this.actionType,
    @required this.alreadyPledged,
    @required this.backingOrg,
    @required this.campaignName,
    @required this.campaignStill,
    @required this.category,
    @required this.contact,
    @required this.crgIdsMany,
    @required this.crgQuantityMany,
    @required this.goal,
    @required this.histPrecedents,
    @required this.id,
    @required this.logoUrl,
    @required this.minPioneers,
    @required this.minRebelsForMedia,
    @required this.minRebelsToWin,
    @required this.organization,
    @required this.strategy,
    @required this.uom,
    @required this.videoURL,
    @required this.actionTime,
    @required this.actionLocation,
  })  : assert(id != null),
        assert(campaignName != null),
        assert(minPioneers != null),
        assert(minRebelsForMedia != null),
        assert(minRebelsToWin != null),
        assert(actionTime != null),
        assert(actionLocation != null),
        assert(alreadyPledged != null),
        assert(logoUrl != null),
        assert(crgQuantityMany != null),
        assert(actionLength != null),
        assert(actionType != null),
        assert(backingOrg != null),
        assert(category != null),
        assert(contact != null),
        assert(goal != null),
        assert(histPrecedents != null),
        assert(organization != null),
        assert(strategy != null),
        assert(videoURL != null),
        assert(uom != null),
        assert(crgIdsMany != null);

  static List<String> mockMasterOrgsNames =
      List<String>.generate(6, (index) => "London Tax Strike $index");

  static List<Org> mockOrgs = List<Org>.generate(
    100,
    (index) => Org(
      id: (index + 1).toString(),
      actionLength: "1",
      actionType: "NVDA",
      alreadyPledged: "29738",
      backingOrg: [
        "Org 1",
        "Org 2",
        "Org 3",
      ],
      campaignName: randomAlpha(10),
      campaignStill: "NY State Pipeline Shutdown",
      category: "Climate",
      contact: "climate@xr.org",
      crgIdsMany: [
        "crg001",
        "crg002",
      ],
      crgQuantityMany: ["500", "5000"],
      goal:
          "We will state a peaceful NVDA at the NYC Pipeline with the demand to have it shut down.",
      histPrecedents: "TBA",
      logoUrl:
          "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2019/10/i-2-90414932-extinction-rebellion-symbol.jpg",
      minPioneers: "${(Random().nextInt(50) + 50)}",
      minRebelsForMedia: "5000",
      minRebelsToWin: "50,000",
      organization:
          "Extinction Rebellion XR ${((index + 1).toString().padLeft(3, "0"))}",
      strategy: "TBA",
      uom: "days",
      videoURL: [
        "https://drive.google.com/open?id=1Fjo5VHzDJw5HV9b4N3GEeAJqFJL66oCg",
        "https://drive.google.com/open?id=1JOiwPp7Bis8W4IUBQlukyL8Pa_H7-Urx",
        "https://drive.google.com/open?id=1eSSkJYZnPRmpWoQHySGe8fHFJsPqycd6"
      ],
      actionLocation: "NYC Pipeline, NY, ${randomAlpha(3)}",
      // random string for different locations
      actionTime: DateTime(2020, Random().nextInt(11) + 1, Random().nextInt(30),
          11, 04), //random date
    ),
  );
}
