///
//  Generated code. Do not modify.
//  source: vendor/github.com/amplify-cms/mod/mod-disco/proto/v2/mod_disco_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../../../google/protobuf/timestamp.pb.dart' as $0;

class UserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCountry')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCity')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedAgeRange')
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  UserInfo._() : super();
  factory UserInfo() => create();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sysAccountRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sysAccountRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSysAccountRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSysAccountRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get selectedCountry => $_getSZ(1);
  @$pb.TagNumber(2)
  set selectedCountry($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSelectedCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectedCountry() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get selectedCity => $_getSZ(2);
  @$pb.TagNumber(3)
  set selectedCity($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelectedCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get selectedAgeRange => $_getSZ(3);
  @$pb.TagNumber(4)
  set selectedAgeRange($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSelectedAgeRange() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelectedAgeRange() => clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureUpdatedAt() => $_ensure(5);
}

class NewUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewUserInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountRefEmail')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCountry')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCity')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedAgeRange')
    ..hasRequiredFields = false
  ;

  NewUserInfo._() : super();
  factory NewUserInfo() => create();
  factory NewUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewUserInfo clone() => NewUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewUserInfo copyWith(void Function(NewUserInfo) updates) => super.copyWith((message) => updates(message as NewUserInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserInfo create() => NewUserInfo._();
  NewUserInfo createEmptyInstance() => create();
  static $pb.PbList<NewUserInfo> createRepeated() => $pb.PbList<NewUserInfo>();
  @$core.pragma('dart2js:noInline')
  static NewUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewUserInfo>(create);
  static NewUserInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sysAccountRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sysAccountRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSysAccountRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSysAccountRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountRefEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountRefEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountRefEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountRefEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get selectedCountry => $_getSZ(2);
  @$pb.TagNumber(3)
  set selectedCountry($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelectedCountry() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedCountry() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get selectedCity => $_getSZ(3);
  @$pb.TagNumber(4)
  set selectedCity($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSelectedCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelectedCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get selectedAgeRange => $_getSZ(4);
  @$pb.TagNumber(5)
  set selectedAgeRange($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSelectedAgeRange() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelectedAgeRange() => clearField(5);
}

class UpdateUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCountry')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedCity')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedAgeRange')
    ..hasRequiredFields = false
  ;

  UpdateUserInfo._() : super();
  factory UpdateUserInfo() => create();
  factory UpdateUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserInfo clone() => UpdateUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserInfo copyWith(void Function(UpdateUserInfo) updates) => super.copyWith((message) => updates(message as UpdateUserInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfo create() => UpdateUserInfo._();
  UpdateUserInfo createEmptyInstance() => create();
  static $pb.PbList<UpdateUserInfo> createRepeated() => $pb.PbList<UpdateUserInfo>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserInfo>(create);
  static UpdateUserInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sysAccountRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sysAccountRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSysAccountRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSysAccountRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get selectedCountry => $_getSZ(1);
  @$pb.TagNumber(2)
  set selectedCountry($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSelectedCountry() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectedCountry() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get selectedCity => $_getSZ(2);
  @$pb.TagNumber(3)
  set selectedCity($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelectedCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get selectedAgeRange => $_getSZ(3);
  @$pb.TagNumber(4)
  set selectedAgeRange($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSelectedAgeRange() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelectedAgeRange() => clearField(4);
}

class UserInfoValues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoValues', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countries')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cities')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedAgeRanges')
    ..hasRequiredFields = false
  ;

  UserInfoValues._() : super();
  factory UserInfoValues() => create();
  factory UserInfoValues.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoValues.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoValues clone() => UserInfoValues()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoValues copyWith(void Function(UserInfoValues) updates) => super.copyWith((message) => updates(message as UserInfoValues)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoValues create() => UserInfoValues._();
  UserInfoValues createEmptyInstance() => create();
  static $pb.PbList<UserInfoValues> createRepeated() => $pb.PbList<UserInfoValues>();
  @$core.pragma('dart2js:noInline')
  static UserInfoValues getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoValues>(create);
  static UserInfoValues _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get countries => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get cities => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get selectedAgeRanges => $_getList(3);
}

class SupportRoleType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SupportRoleType', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..hasRequiredFields = false
  ;

  SupportRoleType._() : super();
  factory SupportRoleType() => create();
  factory SupportRoleType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportRoleType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupportRoleType clone() => SupportRoleType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupportRoleType copyWith(void Function(SupportRoleType) updates) => super.copyWith((message) => updates(message as SupportRoleType)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportRoleType create() => SupportRoleType._();
  SupportRoleType createEmptyInstance() => create();
  static $pb.PbList<SupportRoleType> createRepeated() => $pb.PbList<SupportRoleType>();
  @$core.pragma('dart2js:noInline')
  static SupportRoleType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportRoleType>(create);
  static SupportRoleType _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get unitOfMeasures => $_getSZ(5);
  @$pb.TagNumber(6)
  set unitOfMeasures($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnitOfMeasures() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitOfMeasures() => clearField(6);
}

class NewSupportRoleType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewSupportRoleType', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..hasRequiredFields = false
  ;

  NewSupportRoleType._() : super();
  factory NewSupportRoleType() => create();
  factory NewSupportRoleType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewSupportRoleType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewSupportRoleType clone() => NewSupportRoleType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewSupportRoleType copyWith(void Function(NewSupportRoleType) updates) => super.copyWith((message) => updates(message as NewSupportRoleType)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewSupportRoleType create() => NewSupportRoleType._();
  NewSupportRoleType createEmptyInstance() => create();
  static $pb.PbList<NewSupportRoleType> createRepeated() => $pb.PbList<NewSupportRoleType>();
  @$core.pragma('dart2js:noInline')
  static NewSupportRoleType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewSupportRoleType>(create);
  static NewSupportRoleType _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyProjectRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyProjectRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyProjectRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyProjectRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyProjectRefName => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyProjectRefName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyProjectRefName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyProjectRefName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get unitOfMeasures => $_getSZ(5);
  @$pb.TagNumber(6)
  set unitOfMeasures($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnitOfMeasures() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitOfMeasures() => clearField(6);
}

class SupportRoleValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SupportRoleValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypeRefId')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  SupportRoleValue._() : super();
  factory SupportRoleValue() => create();
  factory SupportRoleValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SupportRoleValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SupportRoleValue clone() => SupportRoleValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SupportRoleValue copyWith(void Function(SupportRoleValue) updates) => super.copyWith((message) => updates(message as SupportRoleValue)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportRoleValue create() => SupportRoleValue._();
  SupportRoleValue createEmptyInstance() => create();
  static $pb.PbList<SupportRoleValue> createRepeated() => $pb.PbList<SupportRoleValue>();
  @$core.pragma('dart2js:noInline')
  static SupportRoleValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SupportRoleValue>(create);
  static SupportRoleValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyUserRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyUserRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyUserRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyUserRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get supportRoleTypeRefId => $_getSZ(2);
  @$pb.TagNumber(3)
  set supportRoleTypeRefId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupportRoleTypeRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupportRoleTypeRefId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get pledged => $_getI64(3);
  @$pb.TagNumber(4)
  set pledged($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPledged() => $_has(3);
  @$pb.TagNumber(4)
  void clearPledged() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(5)
  set comment($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(5)
  void clearComment() => clearField(5);
}

class NewSupportRoleValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewSupportRoleValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypeRefId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypeRefName')
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  NewSupportRoleValue._() : super();
  factory NewSupportRoleValue() => create();
  factory NewSupportRoleValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewSupportRoleValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewSupportRoleValue clone() => NewSupportRoleValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewSupportRoleValue copyWith(void Function(NewSupportRoleValue) updates) => super.copyWith((message) => updates(message as NewSupportRoleValue)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewSupportRoleValue create() => NewSupportRoleValue._();
  NewSupportRoleValue createEmptyInstance() => create();
  static $pb.PbList<NewSupportRoleValue> createRepeated() => $pb.PbList<NewSupportRoleValue>();
  @$core.pragma('dart2js:noInline')
  static NewSupportRoleValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewSupportRoleValue>(create);
  static NewSupportRoleValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyUserRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyUserRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyUserRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyUserRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get surveyUserRefName => $_getSZ(2);
  @$pb.TagNumber(3)
  set surveyUserRefName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurveyUserRefName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurveyUserRefName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get supportRoleTypeRefId => $_getSZ(3);
  @$pb.TagNumber(4)
  set supportRoleTypeRefId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSupportRoleTypeRefId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupportRoleTypeRefId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get supportRoleTypeRefName => $_getSZ(4);
  @$pb.TagNumber(5)
  set supportRoleTypeRefName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSupportRoleTypeRefName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSupportRoleTypeRefName() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get pledged => $_getI64(5);
  @$pb.TagNumber(6)
  set pledged($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPledged() => $_has(5);
  @$pb.TagNumber(6)
  void clearPledged() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get comment => $_getSZ(6);
  @$pb.TagNumber(7)
  set comment($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasComment() => $_has(6);
  @$pb.TagNumber(7)
  void clearComment() => clearField(7);
}

class UserNeedsType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserNeedsType', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'questionGroup')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'questionType')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dropdownQuestion')
    ..hasRequiredFields = false
  ;

  UserNeedsType._() : super();
  factory UserNeedsType() => create();
  factory UserNeedsType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserNeedsType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserNeedsType clone() => UserNeedsType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserNeedsType copyWith(void Function(UserNeedsType) updates) => super.copyWith((message) => updates(message as UserNeedsType)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserNeedsType create() => UserNeedsType._();
  UserNeedsType createEmptyInstance() => create();
  static $pb.PbList<UserNeedsType> createRepeated() => $pb.PbList<UserNeedsType>();
  @$core.pragma('dart2js:noInline')
  static UserNeedsType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserNeedsType>(create);
  static UserNeedsType _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get unitOfMeasures => $_getSZ(5);
  @$pb.TagNumber(6)
  set unitOfMeasures($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnitOfMeasures() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitOfMeasures() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get questionGroup => $_getSZ(6);
  @$pb.TagNumber(7)
  set questionGroup($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasQuestionGroup() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuestionGroup() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get questionType => $_getSZ(7);
  @$pb.TagNumber(8)
  set questionType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQuestionType() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuestionType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get dropdownQuestion => $_getSZ(8);
  @$pb.TagNumber(9)
  set dropdownQuestion($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDropdownQuestion() => $_has(8);
  @$pb.TagNumber(9)
  void clearDropdownQuestion() => clearField(9);
}

class NewUserNeedsType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewUserNeedsType', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'questionGroup')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'questionType')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dropdownQuestion')
    ..hasRequiredFields = false
  ;

  NewUserNeedsType._() : super();
  factory NewUserNeedsType() => create();
  factory NewUserNeedsType.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewUserNeedsType.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewUserNeedsType clone() => NewUserNeedsType()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewUserNeedsType copyWith(void Function(NewUserNeedsType) updates) => super.copyWith((message) => updates(message as NewUserNeedsType)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserNeedsType create() => NewUserNeedsType._();
  NewUserNeedsType createEmptyInstance() => create();
  static $pb.PbList<NewUserNeedsType> createRepeated() => $pb.PbList<NewUserNeedsType>();
  @$core.pragma('dart2js:noInline')
  static NewUserNeedsType getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewUserNeedsType>(create);
  static NewUserNeedsType _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get unitOfMeasures => $_getSZ(5);
  @$pb.TagNumber(6)
  set unitOfMeasures($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnitOfMeasures() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitOfMeasures() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get questionGroup => $_getSZ(6);
  @$pb.TagNumber(7)
  set questionGroup($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasQuestionGroup() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuestionGroup() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get questionType => $_getSZ(7);
  @$pb.TagNumber(8)
  set questionType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQuestionType() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuestionType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get dropdownQuestion => $_getSZ(8);
  @$pb.TagNumber(9)
  set dropdownQuestion($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDropdownQuestion() => $_has(8);
  @$pb.TagNumber(9)
  void clearDropdownQuestion() => clearField(9);
}

class UserNeedsValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserNeedsValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedsTypeRefId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments')
    ..hasRequiredFields = false
  ;

  UserNeedsValue._() : super();
  factory UserNeedsValue() => create();
  factory UserNeedsValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserNeedsValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserNeedsValue clone() => UserNeedsValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserNeedsValue copyWith(void Function(UserNeedsValue) updates) => super.copyWith((message) => updates(message as UserNeedsValue)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserNeedsValue create() => UserNeedsValue._();
  UserNeedsValue createEmptyInstance() => create();
  static $pb.PbList<UserNeedsValue> createRepeated() => $pb.PbList<UserNeedsValue>();
  @$core.pragma('dart2js:noInline')
  static UserNeedsValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserNeedsValue>(create);
  static UserNeedsValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyUserRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyUserRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyUserRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyUserRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userNeedsTypeRefId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userNeedsTypeRefId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserNeedsTypeRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserNeedsTypeRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comments => $_getSZ(3);
  @$pb.TagNumber(4)
  set comments($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComments() => $_has(3);
  @$pb.TagNumber(4)
  void clearComments() => clearField(4);
}

class SurveyValuePlusAccount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SurveyValuePlusAccount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountUserRefName')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  SurveyValuePlusAccount._() : super();
  factory SurveyValuePlusAccount() => create();
  factory SurveyValuePlusAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SurveyValuePlusAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SurveyValuePlusAccount clone() => SurveyValuePlusAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SurveyValuePlusAccount copyWith(void Function(SurveyValuePlusAccount) updates) => super.copyWith((message) => updates(message as SurveyValuePlusAccount)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SurveyValuePlusAccount create() => SurveyValuePlusAccount._();
  SurveyValuePlusAccount createEmptyInstance() => create();
  static $pb.PbList<SurveyValuePlusAccount> createRepeated() => $pb.PbList<SurveyValuePlusAccount>();
  @$core.pragma('dart2js:noInline')
  static SurveyValuePlusAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SurveyValuePlusAccount>(create);
  static SurveyValuePlusAccount _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountUserRefName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountUserRefName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountUserRefName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountUserRefName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pledged => $_getI64(2);
  @$pb.TagNumber(3)
  set pledged($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPledged() => $_has(2);
  @$pb.TagNumber(3)
  void clearPledged() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureCreatedAt() => $_ensure(3);
}

class NewUserNeedsValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewUserNeedsValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedsTypeRefId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedsTypeRefName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments')
    ..hasRequiredFields = false
  ;

  NewUserNeedsValue._() : super();
  factory NewUserNeedsValue() => create();
  factory NewUserNeedsValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewUserNeedsValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewUserNeedsValue clone() => NewUserNeedsValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewUserNeedsValue copyWith(void Function(NewUserNeedsValue) updates) => super.copyWith((message) => updates(message as NewUserNeedsValue)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserNeedsValue create() => NewUserNeedsValue._();
  NewUserNeedsValue createEmptyInstance() => create();
  static $pb.PbList<NewUserNeedsValue> createRepeated() => $pb.PbList<NewUserNeedsValue>();
  @$core.pragma('dart2js:noInline')
  static NewUserNeedsValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewUserNeedsValue>(create);
  static NewUserNeedsValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyUserRefName => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyUserRefName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyUserRefName() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyUserRefName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyUserRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyUserRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyUserRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyUserRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userNeedsTypeRefId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userNeedsTypeRefId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserNeedsTypeRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserNeedsTypeRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userNeedsTypeRefName => $_getSZ(3);
  @$pb.TagNumber(4)
  set userNeedsTypeRefName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserNeedsTypeRefName() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserNeedsTypeRefName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get comments => $_getSZ(4);
  @$pb.TagNumber(5)
  set comments($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasComments() => $_has(4);
  @$pb.TagNumber(5)
  void clearComments() => clearField(5);
}

class SurveyProject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SurveyProject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefId')
    ..pc<SupportRoleType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypes', $pb.PbFieldType.PM, subBuilder: SupportRoleType.create)
    ..pc<UserNeedsType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedTypes', $pb.PbFieldType.PM, subBuilder: UserNeedsType.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectName')
    ..hasRequiredFields = false
  ;

  SurveyProject._() : super();
  factory SurveyProject() => create();
  factory SurveyProject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SurveyProject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SurveyProject clone() => SurveyProject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SurveyProject copyWith(void Function(SurveyProject) updates) => super.copyWith((message) => updates(message as SurveyProject)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SurveyProject create() => SurveyProject._();
  SurveyProject createEmptyInstance() => create();
  static $pb.PbList<SurveyProject> createRepeated() => $pb.PbList<SurveyProject>();
  @$core.pragma('dart2js:noInline')
  static SurveyProject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SurveyProject>(create);
  static SurveyProject _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyProjectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyProjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyProjectId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<SupportRoleType> get supportRoleTypes => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<UserNeedsType> get userNeedTypes => $_getList(3);

  @$pb.TagNumber(5)
  $0.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureUpdatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get surveyProjectName => $_getSZ(6);
  @$pb.TagNumber(7)
  set surveyProjectName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSurveyProjectName() => $_has(6);
  @$pb.TagNumber(7)
  void clearSurveyProjectName() => clearField(7);
}

class SurveyUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SurveyUser', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountAccountRefId')
    ..pc<SupportRoleValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleValues', $pb.PbFieldType.PM, subBuilder: SupportRoleValue.create)
    ..pc<UserNeedsValue>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedValues', $pb.PbFieldType.PM, subBuilder: UserNeedsValue.create)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefName')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserName')
    ..hasRequiredFields = false
  ;

  SurveyUser._() : super();
  factory SurveyUser() => create();
  factory SurveyUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SurveyUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SurveyUser clone() => SurveyUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SurveyUser copyWith(void Function(SurveyUser) updates) => super.copyWith((message) => updates(message as SurveyUser)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SurveyUser create() => SurveyUser._();
  SurveyUser createEmptyInstance() => create();
  static $pb.PbList<SurveyUser> createRepeated() => $pb.PbList<SurveyUser>();
  @$core.pragma('dart2js:noInline')
  static SurveyUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SurveyUser>(create);
  static SurveyUser _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surveyProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set surveyProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sysAccountAccountRefId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sysAccountAccountRefId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSysAccountAccountRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSysAccountAccountRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SupportRoleValue> get supportRoleValues => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<UserNeedsValue> get userNeedValues => $_getList(4);

  @$pb.TagNumber(6)
  $0.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($0.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureUpdatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get surveyProjectRefName => $_getSZ(7);
  @$pb.TagNumber(8)
  set surveyProjectRefName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSurveyProjectRefName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSurveyProjectRefName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get surveyUserName => $_getSZ(8);
  @$pb.TagNumber(9)
  set surveyUserName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSurveyUserName() => $_has(8);
  @$pb.TagNumber(9)
  void clearSurveyUserName() => clearField(9);
}

class DiscoProject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscoProject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountOrgRefId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goal')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alreadyPledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionTime', subBuilder: $0.Timestamp.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLocation')
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minPioneers', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsMedia', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsToWin', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLength')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionType')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'histPrecedents')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strategy')
    ..pPS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoUrl')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..aOM<$0.Timestamp>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $0.Timestamp.create)
    ..pPS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageResourceIds')
    ..p<$core.List<$core.int>>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectImages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  DiscoProject._() : super();
  factory DiscoProject() => create();
  factory DiscoProject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoProject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscoProject clone() => DiscoProject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscoProject copyWith(void Function(DiscoProject) updates) => super.copyWith((message) => updates(message as DiscoProject)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoProject create() => DiscoProject._();
  DiscoProject createEmptyInstance() => create();
  static $pb.PbList<DiscoProject> createRepeated() => $pb.PbList<DiscoProject>();
  @$core.pragma('dart2js:noInline')
  static DiscoProject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoProject>(create);
  static DiscoProject _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountProjectRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountProjectRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountProjectRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountProjectRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sysAccountOrgRefId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sysAccountOrgRefId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSysAccountOrgRefId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSysAccountOrgRefId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get goal => $_getSZ(3);
  @$pb.TagNumber(4)
  set goal($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGoal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGoal() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get alreadyPledged => $_getI64(4);
  @$pb.TagNumber(5)
  set alreadyPledged($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAlreadyPledged() => $_has(4);
  @$pb.TagNumber(5)
  void clearAlreadyPledged() => clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get actionTime => $_getN(5);
  @$pb.TagNumber(6)
  set actionTime($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasActionTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearActionTime() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureActionTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get actionLocation => $_getSZ(6);
  @$pb.TagNumber(7)
  set actionLocation($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasActionLocation() => $_has(6);
  @$pb.TagNumber(7)
  void clearActionLocation() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get minPioneers => $_getI64(7);
  @$pb.TagNumber(8)
  set minPioneers($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMinPioneers() => $_has(7);
  @$pb.TagNumber(8)
  void clearMinPioneers() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get minRebelsMedia => $_getI64(8);
  @$pb.TagNumber(9)
  set minRebelsMedia($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMinRebelsMedia() => $_has(8);
  @$pb.TagNumber(9)
  void clearMinRebelsMedia() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get minRebelsToWin => $_getI64(9);
  @$pb.TagNumber(10)
  set minRebelsToWin($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMinRebelsToWin() => $_has(9);
  @$pb.TagNumber(10)
  void clearMinRebelsToWin() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get actionLength => $_getSZ(10);
  @$pb.TagNumber(11)
  set actionLength($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasActionLength() => $_has(10);
  @$pb.TagNumber(11)
  void clearActionLength() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get actionType => $_getSZ(11);
  @$pb.TagNumber(12)
  set actionType($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasActionType() => $_has(11);
  @$pb.TagNumber(12)
  void clearActionType() => clearField(12);

  @$pb.TagNumber(14)
  $core.String get category => $_getSZ(12);
  @$pb.TagNumber(14)
  set category($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasCategory() => $_has(12);
  @$pb.TagNumber(14)
  void clearCategory() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get contact => $_getSZ(13);
  @$pb.TagNumber(15)
  set contact($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasContact() => $_has(13);
  @$pb.TagNumber(15)
  void clearContact() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get histPrecedents => $_getSZ(14);
  @$pb.TagNumber(16)
  set histPrecedents($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasHistPrecedents() => $_has(14);
  @$pb.TagNumber(16)
  void clearHistPrecedents() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get strategy => $_getSZ(15);
  @$pb.TagNumber(17)
  set strategy($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasStrategy() => $_has(15);
  @$pb.TagNumber(17)
  void clearStrategy() => clearField(17);

  @$pb.TagNumber(18)
  $core.List<$core.String> get videoUrl => $_getList(16);

  @$pb.TagNumber(19)
  $core.String get unitOfMeasures => $_getSZ(17);
  @$pb.TagNumber(19)
  set unitOfMeasures($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(19)
  $core.bool hasUnitOfMeasures() => $_has(17);
  @$pb.TagNumber(19)
  void clearUnitOfMeasures() => clearField(19);

  @$pb.TagNumber(20)
  $0.Timestamp get createdAt => $_getN(18);
  @$pb.TagNumber(20)
  set createdAt($0.Timestamp v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasCreatedAt() => $_has(18);
  @$pb.TagNumber(20)
  void clearCreatedAt() => clearField(20);
  @$pb.TagNumber(20)
  $0.Timestamp ensureCreatedAt() => $_ensure(18);

  @$pb.TagNumber(21)
  $0.Timestamp get updatedAt => $_getN(19);
  @$pb.TagNumber(21)
  set updatedAt($0.Timestamp v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasUpdatedAt() => $_has(19);
  @$pb.TagNumber(21)
  void clearUpdatedAt() => clearField(21);
  @$pb.TagNumber(21)
  $0.Timestamp ensureUpdatedAt() => $_ensure(19);

  @$pb.TagNumber(22)
  $core.List<$core.String> get imageResourceIds => $_getList(20);

  @$pb.TagNumber(23)
  $core.List<$core.List<$core.int>> get projectImages => $_getList(21);
}

class NewDiscoProjectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewDiscoProjectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountOrgRefId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goal')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alreadyPledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionTimeNano')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLocation')
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minPioneers', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsMedia', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsToWin', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLength')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionType')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'histPrecedents')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strategy')
    ..pPS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoUrl')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefName')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountOrgRefName')
    ..pPS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageFilepath')
    ..pPS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUploadArrays')
    ..hasRequiredFields = false
  ;

  NewDiscoProjectRequest._() : super();
  factory NewDiscoProjectRequest() => create();
  factory NewDiscoProjectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewDiscoProjectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewDiscoProjectRequest clone() => NewDiscoProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewDiscoProjectRequest copyWith(void Function(NewDiscoProjectRequest) updates) => super.copyWith((message) => updates(message as NewDiscoProjectRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewDiscoProjectRequest create() => NewDiscoProjectRequest._();
  NewDiscoProjectRequest createEmptyInstance() => create();
  static $pb.PbList<NewDiscoProjectRequest> createRepeated() => $pb.PbList<NewDiscoProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static NewDiscoProjectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewDiscoProjectRequest>(create);
  static NewDiscoProjectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sysAccountProjectRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sysAccountProjectRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSysAccountProjectRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSysAccountProjectRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountOrgRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountOrgRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountOrgRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountOrgRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get goal => $_getSZ(2);
  @$pb.TagNumber(3)
  set goal($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGoal() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoal() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get alreadyPledged => $_getI64(3);
  @$pb.TagNumber(4)
  set alreadyPledged($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlreadyPledged() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlreadyPledged() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get actionTimeNano => $_getI64(4);
  @$pb.TagNumber(5)
  set actionTimeNano($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActionTimeNano() => $_has(4);
  @$pb.TagNumber(5)
  void clearActionTimeNano() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get actionLocation => $_getSZ(5);
  @$pb.TagNumber(6)
  set actionLocation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActionLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearActionLocation() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get minPioneers => $_getI64(6);
  @$pb.TagNumber(7)
  set minPioneers($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinPioneers() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinPioneers() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get minRebelsMedia => $_getI64(7);
  @$pb.TagNumber(8)
  set minRebelsMedia($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMinRebelsMedia() => $_has(7);
  @$pb.TagNumber(8)
  void clearMinRebelsMedia() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get minRebelsToWin => $_getI64(8);
  @$pb.TagNumber(9)
  set minRebelsToWin($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMinRebelsToWin() => $_has(8);
  @$pb.TagNumber(9)
  void clearMinRebelsToWin() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get actionLength => $_getSZ(9);
  @$pb.TagNumber(10)
  set actionLength($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasActionLength() => $_has(9);
  @$pb.TagNumber(10)
  void clearActionLength() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get actionType => $_getSZ(10);
  @$pb.TagNumber(11)
  set actionType($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasActionType() => $_has(10);
  @$pb.TagNumber(11)
  void clearActionType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get category => $_getSZ(11);
  @$pb.TagNumber(12)
  set category($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCategory() => $_has(11);
  @$pb.TagNumber(12)
  void clearCategory() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get contact => $_getSZ(12);
  @$pb.TagNumber(13)
  set contact($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasContact() => $_has(12);
  @$pb.TagNumber(13)
  void clearContact() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get histPrecedents => $_getSZ(13);
  @$pb.TagNumber(14)
  set histPrecedents($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasHistPrecedents() => $_has(13);
  @$pb.TagNumber(14)
  void clearHistPrecedents() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get strategy => $_getSZ(14);
  @$pb.TagNumber(15)
  set strategy($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasStrategy() => $_has(14);
  @$pb.TagNumber(15)
  void clearStrategy() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get videoUrl => $_getList(15);

  @$pb.TagNumber(17)
  $core.String get unitOfMeasures => $_getSZ(16);
  @$pb.TagNumber(17)
  set unitOfMeasures($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasUnitOfMeasures() => $_has(16);
  @$pb.TagNumber(17)
  void clearUnitOfMeasures() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get sysAccountProjectRefName => $_getSZ(17);
  @$pb.TagNumber(18)
  set sysAccountProjectRefName($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSysAccountProjectRefName() => $_has(17);
  @$pb.TagNumber(18)
  void clearSysAccountProjectRefName() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get sysAccountOrgRefName => $_getSZ(18);
  @$pb.TagNumber(19)
  set sysAccountOrgRefName($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasSysAccountOrgRefName() => $_has(18);
  @$pb.TagNumber(19)
  void clearSysAccountOrgRefName() => clearField(19);

  @$pb.TagNumber(20)
  $core.List<$core.String> get imageFilepath => $_getList(19);

  @$pb.TagNumber(21)
  $core.List<$core.String> get imageUploadArrays => $_getList(20);
}

class UpdateDiscoProjectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDiscoProjectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goal')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alreadyPledged', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionTime', subBuilder: $0.Timestamp.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLocation')
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minPioneers', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsMedia', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRebelsToWin', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionLength')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionType')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contact')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'histPrecedents')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'strategy')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoUrl')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unitOfMeasures')
    ..p<$core.List<$core.int>>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUploads', $pb.PbFieldType.PY)
    ..pPS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageResourceIds')
    ..hasRequiredFields = false
  ;

  UpdateDiscoProjectRequest._() : super();
  factory UpdateDiscoProjectRequest() => create();
  factory UpdateDiscoProjectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDiscoProjectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDiscoProjectRequest clone() => UpdateDiscoProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDiscoProjectRequest copyWith(void Function(UpdateDiscoProjectRequest) updates) => super.copyWith((message) => updates(message as UpdateDiscoProjectRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDiscoProjectRequest create() => UpdateDiscoProjectRequest._();
  UpdateDiscoProjectRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDiscoProjectRequest> createRepeated() => $pb.PbList<UpdateDiscoProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDiscoProjectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDiscoProjectRequest>(create);
  static UpdateDiscoProjectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get goal => $_getSZ(1);
  @$pb.TagNumber(2)
  set goal($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGoal() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoal() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get alreadyPledged => $_getI64(2);
  @$pb.TagNumber(3)
  set alreadyPledged($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlreadyPledged() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlreadyPledged() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get actionTime => $_getN(3);
  @$pb.TagNumber(4)
  set actionTime($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasActionTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearActionTime() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureActionTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get actionLocation => $_getSZ(4);
  @$pb.TagNumber(5)
  set actionLocation($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActionLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearActionLocation() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get minPioneers => $_getI64(5);
  @$pb.TagNumber(6)
  set minPioneers($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinPioneers() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinPioneers() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get minRebelsMedia => $_getI64(6);
  @$pb.TagNumber(7)
  set minRebelsMedia($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinRebelsMedia() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinRebelsMedia() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get minRebelsToWin => $_getI64(7);
  @$pb.TagNumber(8)
  set minRebelsToWin($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMinRebelsToWin() => $_has(7);
  @$pb.TagNumber(8)
  void clearMinRebelsToWin() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get actionLength => $_getSZ(8);
  @$pb.TagNumber(9)
  set actionLength($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasActionLength() => $_has(8);
  @$pb.TagNumber(9)
  void clearActionLength() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get actionType => $_getSZ(9);
  @$pb.TagNumber(10)
  set actionType($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasActionType() => $_has(9);
  @$pb.TagNumber(10)
  void clearActionType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get category => $_getSZ(10);
  @$pb.TagNumber(11)
  set category($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCategory() => $_has(10);
  @$pb.TagNumber(11)
  void clearCategory() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get contact => $_getSZ(11);
  @$pb.TagNumber(12)
  set contact($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasContact() => $_has(11);
  @$pb.TagNumber(12)
  void clearContact() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get histPrecedents => $_getSZ(12);
  @$pb.TagNumber(13)
  set histPrecedents($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasHistPrecedents() => $_has(12);
  @$pb.TagNumber(13)
  void clearHistPrecedents() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get strategy => $_getSZ(13);
  @$pb.TagNumber(14)
  set strategy($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasStrategy() => $_has(13);
  @$pb.TagNumber(14)
  void clearStrategy() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get videoUrl => $_getSZ(14);
  @$pb.TagNumber(15)
  set videoUrl($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasVideoUrl() => $_has(14);
  @$pb.TagNumber(15)
  void clearVideoUrl() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get unitOfMeasures => $_getSZ(15);
  @$pb.TagNumber(16)
  set unitOfMeasures($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnitOfMeasures() => $_has(15);
  @$pb.TagNumber(16)
  void clearUnitOfMeasures() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<$core.List<$core.int>> get imageUploads => $_getList(16);

  @$pb.TagNumber(18)
  $core.List<$core.String> get imageResourceIds => $_getList(17);
}

class IdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountAccountId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discoProjectId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountOrgId')
    ..hasRequiredFields = false
  ;

  IdRequest._() : super();
  factory IdRequest() => create();
  factory IdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdRequest clone() => IdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdRequest copyWith(void Function(IdRequest) updates) => super.copyWith((message) => updates(message as IdRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdRequest create() => IdRequest._();
  IdRequest createEmptyInstance() => create();
  static $pb.PbList<IdRequest> createRepeated() => $pb.PbList<IdRequest>();
  @$core.pragma('dart2js:noInline')
  static IdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdRequest>(create);
  static IdRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountProjectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountProjectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountProjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountProjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get surveyProjectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set surveyProjectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurveyProjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurveyProjectId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sysAccountAccountId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sysAccountAccountId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSysAccountAccountId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSysAccountAccountId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get discoProjectId => $_getSZ(4);
  @$pb.TagNumber(5)
  set discoProjectId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDiscoProjectId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDiscoProjectId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sysAccountOrgId => $_getSZ(5);
  @$pb.TagNumber(6)
  set sysAccountOrgId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSysAccountOrgId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSysAccountOrgId() => clearField(6);
}

class ListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOM<IdRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idRequest', subBuilder: IdRequest.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'perPageEntries')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPageId')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.OY)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDescending', protoName: 'isDescending')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matcher')
    ..hasRequiredFields = false
  ;

  ListRequest._() : super();
  factory ListRequest() => create();
  factory ListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRequest clone() => ListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRequest copyWith(void Function(ListRequest) updates) => super.copyWith((message) => updates(message as ListRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRequest create() => ListRequest._();
  ListRequest createEmptyInstance() => create();
  static $pb.PbList<ListRequest> createRepeated() => $pb.PbList<ListRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRequest>(create);
  static ListRequest _defaultInstance;

  @$pb.TagNumber(1)
  IdRequest get idRequest => $_getN(0);
  @$pb.TagNumber(1)
  set idRequest(IdRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdRequest() => clearField(1);
  @$pb.TagNumber(1)
  IdRequest ensureIdRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get perPageEntries => $_getI64(1);
  @$pb.TagNumber(2)
  set perPageEntries($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPerPageEntries() => $_has(1);
  @$pb.TagNumber(2)
  void clearPerPageEntries() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get orderBy => $_getSZ(2);
  @$pb.TagNumber(3)
  set orderBy($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrderBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderBy() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get currentPageId => $_getSZ(3);
  @$pb.TagNumber(4)
  set currentPageId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentPageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPageId() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get filters => $_getN(4);
  @$pb.TagNumber(5)
  set filters($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFilters() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilters() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isDescending => $_getBF(5);
  @$pb.TagNumber(6)
  set isDescending($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsDescending() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDescending() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get matcher => $_getSZ(6);
  @$pb.TagNumber(7)
  set matcher($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMatcher() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatcher() => clearField(7);
}

class ListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..pc<SurveyProject>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjects', $pb.PbFieldType.PM, subBuilder: SurveyProject.create)
    ..pc<SurveyUser>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUsers', $pb.PbFieldType.PM, subBuilder: SurveyUser.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPageId')
    ..pc<DiscoProject>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discoProjects', $pb.PbFieldType.PM, subBuilder: DiscoProject.create)
    ..hasRequiredFields = false
  ;

  ListResponse._() : super();
  factory ListResponse() => create();
  factory ListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListResponse clone() => ListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListResponse copyWith(void Function(ListResponse) updates) => super.copyWith((message) => updates(message as ListResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListResponse create() => ListResponse._();
  ListResponse createEmptyInstance() => create();
  static $pb.PbList<ListResponse> createRepeated() => $pb.PbList<ListResponse>();
  @$core.pragma('dart2js:noInline')
  static ListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResponse>(create);
  static ListResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SurveyProject> get surveyProjects => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SurveyUser> get surveyUsers => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nextPageId => $_getI64(2);
  @$pb.TagNumber(3)
  set nextPageId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextPageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<DiscoProject> get discoProjects => $_getList(3);
}

class NewSurveyProjectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewSurveyProjectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefId')
    ..pc<NewSupportRoleType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypes', $pb.PbFieldType.PM, subBuilder: NewSupportRoleType.create)
    ..pc<NewUserNeedsType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedTypes', $pb.PbFieldType.PM, subBuilder: NewUserNeedsType.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountProjectRefName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectName')
    ..hasRequiredFields = false
  ;

  NewSurveyProjectRequest._() : super();
  factory NewSurveyProjectRequest() => create();
  factory NewSurveyProjectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewSurveyProjectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewSurveyProjectRequest clone() => NewSurveyProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewSurveyProjectRequest copyWith(void Function(NewSurveyProjectRequest) updates) => super.copyWith((message) => updates(message as NewSurveyProjectRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewSurveyProjectRequest create() => NewSurveyProjectRequest._();
  NewSurveyProjectRequest createEmptyInstance() => create();
  static $pb.PbList<NewSurveyProjectRequest> createRepeated() => $pb.PbList<NewSurveyProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static NewSurveyProjectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewSurveyProjectRequest>(create);
  static NewSurveyProjectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sysAccountProjectRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sysAccountProjectRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSysAccountProjectRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSysAccountProjectRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<NewSupportRoleType> get supportRoleTypes => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<NewUserNeedsType> get userNeedTypes => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get sysAccountProjectRefName => $_getSZ(3);
  @$pb.TagNumber(4)
  set sysAccountProjectRefName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSysAccountProjectRefName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSysAccountProjectRefName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surveyProjectName => $_getSZ(4);
  @$pb.TagNumber(5)
  set surveyProjectName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurveyProjectName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurveyProjectName() => clearField(5);
}

class NewSurveyUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewSurveyUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountUserRefId')
    ..pc<NewSupportRoleValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleValues', $pb.PbFieldType.PM, subBuilder: NewSupportRoleValue.create)
    ..pc<NewUserNeedsValue>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedValues', $pb.PbFieldType.PM, subBuilder: NewUserNeedsValue.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectRefName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sysAccountUserRefName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserName')
    ..hasRequiredFields = false
  ;

  NewSurveyUserRequest._() : super();
  factory NewSurveyUserRequest() => create();
  factory NewSurveyUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewSurveyUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewSurveyUserRequest clone() => NewSurveyUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewSurveyUserRequest copyWith(void Function(NewSurveyUserRequest) updates) => super.copyWith((message) => updates(message as NewSurveyUserRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewSurveyUserRequest create() => NewSurveyUserRequest._();
  NewSurveyUserRequest createEmptyInstance() => create();
  static $pb.PbList<NewSurveyUserRequest> createRepeated() => $pb.PbList<NewSurveyUserRequest>();
  @$core.pragma('dart2js:noInline')
  static NewSurveyUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewSurveyUserRequest>(create);
  static NewSurveyUserRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyProjectRefId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyProjectRefId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyProjectRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyProjectRefId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sysAccountUserRefId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sysAccountUserRefId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSysAccountUserRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSysAccountUserRefId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<NewSupportRoleValue> get supportRoleValues => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<NewUserNeedsValue> get userNeedValues => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get surveyProjectRefName => $_getSZ(4);
  @$pb.TagNumber(5)
  set surveyProjectRefName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurveyProjectRefName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurveyProjectRefName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sysAccountUserRefName => $_getSZ(5);
  @$pb.TagNumber(6)
  set sysAccountUserRefName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSysAccountUserRefName() => $_has(5);
  @$pb.TagNumber(6)
  void clearSysAccountUserRefName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get surveyUserName => $_getSZ(6);
  @$pb.TagNumber(7)
  set surveyUserName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSurveyUserName() => $_has(6);
  @$pb.TagNumber(7)
  void clearSurveyUserName() => clearField(7);
}

class UpdateSurveyProjectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSurveyProjectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyProjectId')
    ..pc<SupportRoleType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleTypes', $pb.PbFieldType.PM, subBuilder: SupportRoleType.create)
    ..pc<UserNeedsType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedTypes', $pb.PbFieldType.PM, subBuilder: UserNeedsType.create)
    ..hasRequiredFields = false
  ;

  UpdateSurveyProjectRequest._() : super();
  factory UpdateSurveyProjectRequest() => create();
  factory UpdateSurveyProjectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSurveyProjectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSurveyProjectRequest clone() => UpdateSurveyProjectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSurveyProjectRequest copyWith(void Function(UpdateSurveyProjectRequest) updates) => super.copyWith((message) => updates(message as UpdateSurveyProjectRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyProjectRequest create() => UpdateSurveyProjectRequest._();
  UpdateSurveyProjectRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSurveyProjectRequest> createRepeated() => $pb.PbList<UpdateSurveyProjectRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyProjectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSurveyProjectRequest>(create);
  static UpdateSurveyProjectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyProjectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyProjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyProjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyProjectId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SupportRoleType> get supportRoleTypes => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<UserNeedsType> get userNeedTypes => $_getList(2);
}

class UpdateSurveyUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSurveyUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyUserId')
    ..pc<SupportRoleValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportRoleValues', $pb.PbFieldType.PM, subBuilder: SupportRoleValue.create)
    ..pc<UserNeedsValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userNeedValues', $pb.PbFieldType.PM, subBuilder: UserNeedsValue.create)
    ..hasRequiredFields = false
  ;

  UpdateSurveyUserRequest._() : super();
  factory UpdateSurveyUserRequest() => create();
  factory UpdateSurveyUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSurveyUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSurveyUserRequest clone() => UpdateSurveyUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSurveyUserRequest copyWith(void Function(UpdateSurveyUserRequest) updates) => super.copyWith((message) => updates(message as UpdateSurveyUserRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyUserRequest create() => UpdateSurveyUserRequest._();
  UpdateSurveyUserRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSurveyUserRequest> createRepeated() => $pb.PbList<UpdateSurveyUserRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSurveyUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSurveyUserRequest>(create);
  static UpdateSurveyUserRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surveyUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set surveyUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSurveyUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurveyUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SupportRoleValue> get supportRoleValues => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<UserNeedsValue> get userNeedValues => $_getList(2);
}

class GenIdResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenIdResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tempId')
    ..hasRequiredFields = false
  ;

  GenIdResponse._() : super();
  factory GenIdResponse() => create();
  factory GenIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenIdResponse clone() => GenIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenIdResponse copyWith(void Function(GenIdResponse) updates) => super.copyWith((message) => updates(message as GenIdResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenIdResponse create() => GenIdResponse._();
  GenIdResponse createEmptyInstance() => create();
  static $pb.PbList<GenIdResponse> createRepeated() => $pb.PbList<GenIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GenIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenIdResponse>(create);
  static GenIdResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tempId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tempId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTempId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTempId() => clearField(1);
}

class StatisticRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StatisticRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tableName')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'includeCounts')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.OY)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPageId')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDescending')
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'perPageEntries')
    ..hasRequiredFields = false
  ;

  StatisticRequest._() : super();
  factory StatisticRequest() => create();
  factory StatisticRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatisticRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatisticRequest clone() => StatisticRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatisticRequest copyWith(void Function(StatisticRequest) updates) => super.copyWith((message) => updates(message as StatisticRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticRequest create() => StatisticRequest._();
  StatisticRequest createEmptyInstance() => create();
  static $pb.PbList<StatisticRequest> createRepeated() => $pb.PbList<StatisticRequest>();
  @$core.pragma('dart2js:noInline')
  static StatisticRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatisticRequest>(create);
  static StatisticRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tableName => $_getSZ(0);
  @$pb.TagNumber(1)
  set tableName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTableName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTableName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeCounts => $_getBF(1);
  @$pb.TagNumber(2)
  set includeCounts($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIncludeCounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeCounts() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get filters => $_getN(2);
  @$pb.TagNumber(3)
  set filters($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilters() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilters() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get currentPageId => $_getSZ(3);
  @$pb.TagNumber(4)
  set currentPageId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentPageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPageId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get limit => $_getI64(4);
  @$pb.TagNumber(5)
  set limit($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get orderBy => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderBy($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderBy() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isDescending => $_getBF(6);
  @$pb.TagNumber(7)
  set isDescending($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsDescending() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsDescending() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get perPageEntries => $_getI64(7);
  @$pb.TagNumber(8)
  set perPageEntries($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPerPageEntries() => $_has(7);
  @$pb.TagNumber(8)
  void clearPerPageEntries() => clearField(8);
}

class StatisticResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StatisticResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.mod_disco.services'), createEmptyInstance: create)
    ..pc<SurveyValuePlusAccount>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyValuePlusAccount', $pb.PbFieldType.PM, subBuilder: SurveyValuePlusAccount.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPageId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalCount')
    ..hasRequiredFields = false
  ;

  StatisticResponse._() : super();
  factory StatisticResponse() => create();
  factory StatisticResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatisticResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatisticResponse clone() => StatisticResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatisticResponse copyWith(void Function(StatisticResponse) updates) => super.copyWith((message) => updates(message as StatisticResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticResponse create() => StatisticResponse._();
  StatisticResponse createEmptyInstance() => create();
  static $pb.PbList<StatisticResponse> createRepeated() => $pb.PbList<StatisticResponse>();
  @$core.pragma('dart2js:noInline')
  static StatisticResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatisticResponse>(create);
  static StatisticResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SurveyValuePlusAccount> get surveyValuePlusAccount => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextPageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalCount => $_getI64(2);
  @$pb.TagNumber(3)
  set totalCount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalCount() => clearField(3);
}

