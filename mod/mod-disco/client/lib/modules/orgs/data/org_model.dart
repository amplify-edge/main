import 'package:meta/meta.dart';

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
    this.campaignStill,
    @required this.category,
    @required this.contact,
    this.crgIdsMany,
    this.crgQuantityMany,
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
    this.videoURL,
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
        //assert(crgQuantityMany != null),
        //assert(crgIdsMany != null),
        assert(actionLength != null),
        assert(actionType != null),
        assert(backingOrg != null),
        assert(category != null),
        assert(contact != null),
        assert(goal != null),
        assert(histPrecedents != null),
        assert(organization != null),
        assert(strategy != null),
        //assert(videoURL != null),
        assert(uom != null);
}
