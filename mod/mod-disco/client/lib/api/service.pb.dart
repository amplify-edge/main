///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

class ListSupportRoleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListSupportRoleRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListSupportRoleRequest._() : super();
  factory ListSupportRoleRequest() => create();
  factory ListSupportRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSupportRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListSupportRoleRequest clone() => ListSupportRoleRequest()..mergeFromMessage(this);
  ListSupportRoleRequest copyWith(void Function(ListSupportRoleRequest) updates) => super.copyWith((message) => updates(message as ListSupportRoleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListSupportRoleRequest create() => ListSupportRoleRequest._();
  ListSupportRoleRequest createEmptyInstance() => create();
  static $pb.PbList<ListSupportRoleRequest> createRepeated() => $pb.PbList<ListSupportRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSupportRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSupportRoleRequest>(create);
  static ListSupportRoleRequest _defaultInstance;
}

class GetSupportRoleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetSupportRoleRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  GetSupportRoleRequest._() : super();
  factory GetSupportRoleRequest() => create();
  factory GetSupportRoleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSupportRoleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetSupportRoleRequest clone() => GetSupportRoleRequest()..mergeFromMessage(this);
  GetSupportRoleRequest copyWith(void Function(GetSupportRoleRequest) updates) => super.copyWith((message) => updates(message as GetSupportRoleRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSupportRoleRequest create() => GetSupportRoleRequest._();
  GetSupportRoleRequest createEmptyInstance() => create();
  static $pb.PbList<GetSupportRoleRequest> createRepeated() => $pb.PbList<GetSupportRoleRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSupportRoleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSupportRoleRequest>(create);
  static GetSupportRoleRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Campaigns extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Campaigns', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<Campaign>(1, 'campaigns', $pb.PbFieldType.PM, subBuilder: Campaign.create)
    ..hasRequiredFields = false
  ;

  Campaigns._() : super();
  factory Campaigns() => create();
  factory Campaigns.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Campaigns.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Campaigns clone() => Campaigns()..mergeFromMessage(this);
  Campaigns copyWith(void Function(Campaigns) updates) => super.copyWith((message) => updates(message as Campaigns));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Campaigns create() => Campaigns._();
  Campaigns createEmptyInstance() => create();
  static $pb.PbList<Campaigns> createRepeated() => $pb.PbList<Campaigns>();
  @$core.pragma('dart2js:noInline')
  static Campaigns getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Campaigns>(create);
  static Campaigns _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Campaign> get campaigns => $_getList(0);
}

class ListCampaignRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListCampaignRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListCampaignRequest._() : super();
  factory ListCampaignRequest() => create();
  factory ListCampaignRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCampaignRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListCampaignRequest clone() => ListCampaignRequest()..mergeFromMessage(this);
  ListCampaignRequest copyWith(void Function(ListCampaignRequest) updates) => super.copyWith((message) => updates(message as ListCampaignRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListCampaignRequest create() => ListCampaignRequest._();
  ListCampaignRequest createEmptyInstance() => create();
  static $pb.PbList<ListCampaignRequest> createRepeated() => $pb.PbList<ListCampaignRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCampaignRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCampaignRequest>(create);
  static ListCampaignRequest _defaultInstance;
}

class GetCampaignRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetCampaignRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  GetCampaignRequest._() : super();
  factory GetCampaignRequest() => create();
  factory GetCampaignRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCampaignRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetCampaignRequest clone() => GetCampaignRequest()..mergeFromMessage(this);
  GetCampaignRequest copyWith(void Function(GetCampaignRequest) updates) => super.copyWith((message) => updates(message as GetCampaignRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCampaignRequest create() => GetCampaignRequest._();
  GetCampaignRequest createEmptyInstance() => create();
  static $pb.PbList<GetCampaignRequest> createRepeated() => $pb.PbList<GetCampaignRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCampaignRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCampaignRequest>(create);
  static GetCampaignRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class NewAnswerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewAnswerRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'selSupportRoleId')
    ..aOS(3, 'selCampaignId')
    ..aOS(4, 'minHoursPledged')
    ..hasRequiredFields = false
  ;

  NewAnswerRequest._() : super();
  factory NewAnswerRequest() => create();
  factory NewAnswerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewAnswerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NewAnswerRequest clone() => NewAnswerRequest()..mergeFromMessage(this);
  NewAnswerRequest copyWith(void Function(NewAnswerRequest) updates) => super.copyWith((message) => updates(message as NewAnswerRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewAnswerRequest create() => NewAnswerRequest._();
  NewAnswerRequest createEmptyInstance() => create();
  static $pb.PbList<NewAnswerRequest> createRepeated() => $pb.PbList<NewAnswerRequest>();
  @$core.pragma('dart2js:noInline')
  static NewAnswerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewAnswerRequest>(create);
  static NewAnswerRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get selSupportRoleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set selSupportRoleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSelSupportRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelSupportRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get selCampaignId => $_getSZ(2);
  @$pb.TagNumber(3)
  set selCampaignId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelCampaignId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelCampaignId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get minHoursPledged => $_getSZ(3);
  @$pb.TagNumber(4)
  set minHoursPledged($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinHoursPledged() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinHoursPledged() => clearField(4);
}

class Answer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Answer', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'selSupportRoleId')
    ..aOS(3, 'selCampaignId')
    ..aOS(4, 'minHoursPledged')
    ..aOM<$2.Timestamp>(5, 'createdAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Answer._() : super();
  factory Answer() => create();
  factory Answer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Answer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Answer clone() => Answer()..mergeFromMessage(this);
  Answer copyWith(void Function(Answer) updates) => super.copyWith((message) => updates(message as Answer));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Answer create() => Answer._();
  Answer createEmptyInstance() => create();
  static $pb.PbList<Answer> createRepeated() => $pb.PbList<Answer>();
  @$core.pragma('dart2js:noInline')
  static Answer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Answer>(create);
  static Answer _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get selSupportRoleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set selSupportRoleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSelSupportRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelSupportRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get selCampaignId => $_getSZ(2);
  @$pb.TagNumber(3)
  set selCampaignId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelCampaignId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelCampaignId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get minHoursPledged => $_getSZ(3);
  @$pb.TagNumber(4)
  set minHoursPledged($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinHoursPledged() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinHoursPledged() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreatedAt() => $_ensure(4);
}

class Answers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Answers', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<Answer>(1, 'answers', $pb.PbFieldType.PM, subBuilder: Answer.create)
    ..hasRequiredFields = false
  ;

  Answers._() : super();
  factory Answers() => create();
  factory Answers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Answers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Answers clone() => Answers()..mergeFromMessage(this);
  Answers copyWith(void Function(Answers) updates) => super.copyWith((message) => updates(message as Answers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Answers create() => Answers._();
  Answers createEmptyInstance() => create();
  static $pb.PbList<Answers> createRepeated() => $pb.PbList<Answers>();
  @$core.pragma('dart2js:noInline')
  static Answers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Answers>(create);
  static Answers _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Answer> get answers => $_getList(0);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'firstName')
    ..aOS(3, 'lastName')
    ..aOS(4, 'email')
    ..aOS(5, 'displayName')
    ..aOS(6, 'avatar')
    ..aOS(7, 'url')
    ..aOS(8, 'chatgroupIds')
    ..aOS(9, 'campaign')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get displayName => $_getSZ(4);
  @$pb.TagNumber(5)
  set displayName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplayName() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get chatgroupIds => $_getSZ(7);
  @$pb.TagNumber(8)
  set chatgroupIds($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasChatgroupIds() => $_has(7);
  @$pb.TagNumber(8)
  void clearChatgroupIds() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get campaign => $_getSZ(8);
  @$pb.TagNumber(9)
  set campaign($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCampaign() => $_has(8);
  @$pb.TagNumber(9)
  void clearCampaign() => clearField(9);
}

class SupportRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SupportRole', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..aOS(3, 'comment')
    ..aOB(4, 'mandatory')
    ..aOS(5, 'uom')
    ..hasRequiredFields = false
  ;

  SupportRole._() : super();
  factory SupportRole() => create();
  factory SupportRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SupportRole clone() => SupportRole()..mergeFromMessage(this);
  SupportRole copyWith(void Function(SupportRole) updates) => super.copyWith((message) => updates(message as SupportRole));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportRole create() => SupportRole._();
  SupportRole createEmptyInstance() => create();
  static $pb.PbList<SupportRole> createRepeated() => $pb.PbList<SupportRole>();
  @$core.pragma('dart2js:noInline')
  static SupportRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportRole>(create);
  static SupportRole _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get mandatory => $_getBF(3);
  @$pb.TagNumber(4)
  set mandatory($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMandatory() => $_has(3);
  @$pb.TagNumber(4)
  void clearMandatory() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uom => $_getSZ(4);
  @$pb.TagNumber(5)
  set uom($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUom() => $_has(4);
  @$pb.TagNumber(5)
  void clearUom() => clearField(5);
}

enum Campaign_ActionLength {
  actionLengthString, 
  actionLengthInt, 
  notSet
}

class Campaign extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Campaign_ActionLength> _Campaign_ActionLengthByTag = {
    24 : Campaign_ActionLength.actionLengthString,
    25 : Campaign_ActionLength.actionLengthInt,
    0 : Campaign_ActionLength.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Campaign', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..oo(0, [24, 25])
    ..aOS(1, 'campaignId')
    ..aOS(2, 'campaignName')
    ..aOS(3, 'logoUrl')
    ..aOS(4, 'goal')
    ..pPS(5, 'crgQuantityMany')
    ..pPS(6, 'crgIdsMany')
    ..aOS(7, 'alreadyPledged')
    ..aOM<$2.Timestamp>(8, 'actionTime', subBuilder: $2.Timestamp.create)
    ..aOS(9, 'actionLocation')
    ..aOS(10, 'campaignStill')
    ..aOS(11, 'minPioneers')
    ..aOS(12, 'minRebelsForMedia')
    ..aOS(13, 'minRebelsToWin')
    ..aOS(15, 'actionType')
    ..pPS(16, 'backingOrg')
    ..aOS(17, 'category')
    ..aOS(18, 'contact')
    ..aOS(19, 'histPrecedents')
    ..aOS(20, 'organization')
    ..aOS(21, 'strategy')
    ..pPS(22, 'videoUrl')
    ..aOS(23, 'uom')
    ..aOS(24, 'actionLengthString')
    ..a<$core.int>(25, 'actionLengthInt', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Campaign._() : super();
  factory Campaign() => create();
  factory Campaign.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Campaign.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Campaign clone() => Campaign()..mergeFromMessage(this);
  Campaign copyWith(void Function(Campaign) updates) => super.copyWith((message) => updates(message as Campaign));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Campaign create() => Campaign._();
  Campaign createEmptyInstance() => create();
  static $pb.PbList<Campaign> createRepeated() => $pb.PbList<Campaign>();
  @$core.pragma('dart2js:noInline')
  static Campaign getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Campaign>(create);
  static Campaign _defaultInstance;

  Campaign_ActionLength whichActionLength() => _Campaign_ActionLengthByTag[$_whichOneof(0)];
  void clearActionLength() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get campaignId => $_getSZ(0);
  @$pb.TagNumber(1)
  set campaignId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCampaignId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCampaignId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get campaignName => $_getSZ(1);
  @$pb.TagNumber(2)
  set campaignName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCampaignName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCampaignName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logoUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set logoUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogoUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogoUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get goal => $_getSZ(3);
  @$pb.TagNumber(4)
  set goal($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGoal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGoal() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get crgQuantityMany => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get crgIdsMany => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get alreadyPledged => $_getSZ(6);
  @$pb.TagNumber(7)
  set alreadyPledged($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAlreadyPledged() => $_has(6);
  @$pb.TagNumber(7)
  void clearAlreadyPledged() => clearField(7);

  @$pb.TagNumber(8)
  $2.Timestamp get actionTime => $_getN(7);
  @$pb.TagNumber(8)
  set actionTime($2.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasActionTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearActionTime() => clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureActionTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get actionLocation => $_getSZ(8);
  @$pb.TagNumber(9)
  set actionLocation($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasActionLocation() => $_has(8);
  @$pb.TagNumber(9)
  void clearActionLocation() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get campaignStill => $_getSZ(9);
  @$pb.TagNumber(10)
  set campaignStill($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCampaignStill() => $_has(9);
  @$pb.TagNumber(10)
  void clearCampaignStill() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get minPioneers => $_getSZ(10);
  @$pb.TagNumber(11)
  set minPioneers($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMinPioneers() => $_has(10);
  @$pb.TagNumber(11)
  void clearMinPioneers() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get minRebelsForMedia => $_getSZ(11);
  @$pb.TagNumber(12)
  set minRebelsForMedia($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMinRebelsForMedia() => $_has(11);
  @$pb.TagNumber(12)
  void clearMinRebelsForMedia() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get minRebelsToWin => $_getSZ(12);
  @$pb.TagNumber(13)
  set minRebelsToWin($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasMinRebelsToWin() => $_has(12);
  @$pb.TagNumber(13)
  void clearMinRebelsToWin() => clearField(13);

  @$pb.TagNumber(15)
  $core.String get actionType => $_getSZ(13);
  @$pb.TagNumber(15)
  set actionType($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasActionType() => $_has(13);
  @$pb.TagNumber(15)
  void clearActionType() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get backingOrg => $_getList(14);

  @$pb.TagNumber(17)
  $core.String get category => $_getSZ(15);
  @$pb.TagNumber(17)
  set category($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasCategory() => $_has(15);
  @$pb.TagNumber(17)
  void clearCategory() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get contact => $_getSZ(16);
  @$pb.TagNumber(18)
  set contact($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(18)
  $core.bool hasContact() => $_has(16);
  @$pb.TagNumber(18)
  void clearContact() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get histPrecedents => $_getSZ(17);
  @$pb.TagNumber(19)
  set histPrecedents($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(19)
  $core.bool hasHistPrecedents() => $_has(17);
  @$pb.TagNumber(19)
  void clearHistPrecedents() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get organization => $_getSZ(18);
  @$pb.TagNumber(20)
  set organization($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(20)
  $core.bool hasOrganization() => $_has(18);
  @$pb.TagNumber(20)
  void clearOrganization() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get strategy => $_getSZ(19);
  @$pb.TagNumber(21)
  set strategy($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(21)
  $core.bool hasStrategy() => $_has(19);
  @$pb.TagNumber(21)
  void clearStrategy() => clearField(21);

  @$pb.TagNumber(22)
  $core.List<$core.String> get videoUrl => $_getList(20);

  @$pb.TagNumber(23)
  $core.String get uom => $_getSZ(21);
  @$pb.TagNumber(23)
  set uom($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(23)
  $core.bool hasUom() => $_has(21);
  @$pb.TagNumber(23)
  void clearUom() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get actionLengthString => $_getSZ(22);
  @$pb.TagNumber(24)
  set actionLengthString($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(24)
  $core.bool hasActionLengthString() => $_has(22);
  @$pb.TagNumber(24)
  void clearActionLengthString() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get actionLengthInt => $_getIZ(23);
  @$pb.TagNumber(25)
  set actionLengthInt($core.int v) { $_setUnsignedInt32(23, v); }
  @$pb.TagNumber(25)
  $core.bool hasActionLengthInt() => $_has(23);
  @$pb.TagNumber(25)
  void clearActionLengthInt() => clearField(25);
}

class NewAnswerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewAnswerResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'id')
    ..hasRequiredFields = false
  ;

  NewAnswerResponse._() : super();
  factory NewAnswerResponse() => create();
  factory NewAnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewAnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NewAnswerResponse clone() => NewAnswerResponse()..mergeFromMessage(this);
  NewAnswerResponse copyWith(void Function(NewAnswerResponse) updates) => super.copyWith((message) => updates(message as NewAnswerResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewAnswerResponse create() => NewAnswerResponse._();
  NewAnswerResponse createEmptyInstance() => create();
  static $pb.PbList<NewAnswerResponse> createRepeated() => $pb.PbList<NewAnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static NewAnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewAnswerResponse>(create);
  static NewAnswerResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class DeleteAnswerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteAnswerResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  DeleteAnswerResponse._() : super();
  factory DeleteAnswerResponse() => create();
  factory DeleteAnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteAnswerResponse clone() => DeleteAnswerResponse()..mergeFromMessage(this);
  DeleteAnswerResponse copyWith(void Function(DeleteAnswerResponse) updates) => super.copyWith((message) => updates(message as DeleteAnswerResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteAnswerResponse create() => DeleteAnswerResponse._();
  DeleteAnswerResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAnswerResponse> createRepeated() => $pb.PbList<DeleteAnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAnswerResponse>(create);
  static DeleteAnswerResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AnswerIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AnswerIdRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  AnswerIdRequest._() : super();
  factory AnswerIdRequest() => create();
  factory AnswerIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnswerIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AnswerIdRequest clone() => AnswerIdRequest()..mergeFromMessage(this);
  AnswerIdRequest copyWith(void Function(AnswerIdRequest) updates) => super.copyWith((message) => updates(message as AnswerIdRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnswerIdRequest create() => AnswerIdRequest._();
  AnswerIdRequest createEmptyInstance() => create();
  static $pb.PbList<AnswerIdRequest> createRepeated() => $pb.PbList<AnswerIdRequest>();
  @$core.pragma('dart2js:noInline')
  static AnswerIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnswerIdRequest>(create);
  static AnswerIdRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class SupportRoles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SupportRoles', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<SupportRole>(1, 'supportRoles', $pb.PbFieldType.PM, subBuilder: SupportRole.create)
    ..hasRequiredFields = false
  ;

  SupportRoles._() : super();
  factory SupportRoles() => create();
  factory SupportRoles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportRoles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SupportRoles clone() => SupportRoles()..mergeFromMessage(this);
  SupportRoles copyWith(void Function(SupportRoles) updates) => super.copyWith((message) => updates(message as SupportRoles));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportRoles create() => SupportRoles._();
  SupportRoles createEmptyInstance() => create();
  static $pb.PbList<SupportRoles> createRepeated() => $pb.PbList<SupportRoles>();
  @$core.pragma('dart2js:noInline')
  static SupportRoles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportRoles>(create);
  static SupportRoles _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SupportRole> get supportRoles => $_getList(0);
}

class ListAnswersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAnswersRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'supportRoleId')
    ..aOS(2, 'campaignId')
    ..hasRequiredFields = false
  ;

  ListAnswersRequest._() : super();
  factory ListAnswersRequest() => create();
  factory ListAnswersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAnswersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAnswersRequest clone() => ListAnswersRequest()..mergeFromMessage(this);
  ListAnswersRequest copyWith(void Function(ListAnswersRequest) updates) => super.copyWith((message) => updates(message as ListAnswersRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAnswersRequest create() => ListAnswersRequest._();
  ListAnswersRequest createEmptyInstance() => create();
  static $pb.PbList<ListAnswersRequest> createRepeated() => $pb.PbList<ListAnswersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAnswersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAnswersRequest>(create);
  static ListAnswersRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supportRoleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supportRoleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupportRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupportRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get campaignId => $_getSZ(1);
  @$pb.TagNumber(2)
  set campaignId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCampaignId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCampaignId() => clearField(2);
}

class ListUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListUserRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListUserRequest._() : super();
  factory ListUserRequest() => create();
  factory ListUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListUserRequest clone() => ListUserRequest()..mergeFromMessage(this);
  ListUserRequest copyWith(void Function(ListUserRequest) updates) => super.copyWith((message) => updates(message as ListUserRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListUserRequest create() => ListUserRequest._();
  ListUserRequest createEmptyInstance() => create();
  static $pb.PbList<ListUserRequest> createRepeated() => $pb.PbList<ListUserRequest>();
  @$core.pragma('dart2js:noInline')
  static ListUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUserRequest>(create);
  static ListUserRequest _defaultInstance;
}

class GetUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUserRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  GetUserRequest._() : super();
  factory GetUserRequest() => create();
  factory GetUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  GetUserRequest copyWith(void Function(GetUserRequest) updates) => super.copyWith((message) => updates(message as GetUserRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() => $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Users extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Users', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<User>(1, 'users', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  Users._() : super();
  factory Users() => create();
  factory Users.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Users.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Users clone() => Users()..mergeFromMessage(this);
  Users copyWith(void Function(Users) updates) => super.copyWith((message) => updates(message as Users));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Users create() => Users._();
  Users createEmptyInstance() => create();
  static $pb.PbList<Users> createRepeated() => $pb.PbList<Users>();
  @$core.pragma('dart2js:noInline')
  static Users getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Users>(create);
  static Users _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<User> get users => $_getList(0);
}

class MigrateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MigrateRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'datapath')
    ..hasRequiredFields = false
  ;

  MigrateRequest._() : super();
  factory MigrateRequest() => create();
  factory MigrateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MigrateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MigrateRequest clone() => MigrateRequest()..mergeFromMessage(this);
  MigrateRequest copyWith(void Function(MigrateRequest) updates) => super.copyWith((message) => updates(message as MigrateRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MigrateRequest create() => MigrateRequest._();
  MigrateRequest createEmptyInstance() => create();
  static $pb.PbList<MigrateRequest> createRepeated() => $pb.PbList<MigrateRequest>();
  @$core.pragma('dart2js:noInline')
  static MigrateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MigrateRequest>(create);
  static MigrateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get datapath => $_getSZ(0);
  @$pb.TagNumber(1)
  set datapath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDatapath() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatapath() => clearField(1);
}

