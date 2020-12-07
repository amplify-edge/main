///
//  Generated code. Do not modify.
//  source: main_bootstrap_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'vendor/github.com/getcouragenow/sys-share/sys-account/proto/v2/sys_account_models.pb.dart' as $2;
import 'vendor/github.com/getcouragenow/mod/mod-disco/proto/v2/mod_disco_models.pb.dart' as $3;
import 'google/protobuf/timestamp.pb.dart' as $4;

class BSProject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BSProject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOM<$2.ProjectRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'project', subBuilder: $2.ProjectRequest.create)
    ..aOM<$3.NewDiscoProjectRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectDetails', subBuilder: $3.NewDiscoProjectRequest.create)
    ..aOM<$3.NewSurveyProjectRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveySchema', subBuilder: $3.NewSurveyProjectRequest.create)
    ..hasRequiredFields = false
  ;

  BSProject._() : super();
  factory BSProject() => create();
  factory BSProject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BSProject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BSProject clone() => BSProject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BSProject copyWith(void Function(BSProject) updates) => super.copyWith((message) => updates(message as BSProject)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BSProject create() => BSProject._();
  BSProject createEmptyInstance() => create();
  static $pb.PbList<BSProject> createRepeated() => $pb.PbList<BSProject>();
  @$core.pragma('dart2js:noInline')
  static BSProject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BSProject>(create);
  static BSProject _defaultInstance;

  @$pb.TagNumber(1)
  $2.ProjectRequest get project => $_getN(0);
  @$pb.TagNumber(1)
  set project($2.ProjectRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProject() => $_has(0);
  @$pb.TagNumber(1)
  void clearProject() => clearField(1);
  @$pb.TagNumber(1)
  $2.ProjectRequest ensureProject() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.NewDiscoProjectRequest get projectDetails => $_getN(1);
  @$pb.TagNumber(2)
  set projectDetails($3.NewDiscoProjectRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProjectDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearProjectDetails() => clearField(2);
  @$pb.TagNumber(2)
  $3.NewDiscoProjectRequest ensureProjectDetails() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.NewSurveyProjectRequest get surveySchema => $_getN(2);
  @$pb.TagNumber(3)
  set surveySchema($3.NewSurveyProjectRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurveySchema() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurveySchema() => clearField(3);
  @$pb.TagNumber(3)
  $3.NewSurveyProjectRequest ensureSurveySchema() => $_ensure(2);
}

class BSOrg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BSOrg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOM<$2.OrgRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'org', subBuilder: $2.OrgRequest.create)
    ..hasRequiredFields = false
  ;

  BSOrg._() : super();
  factory BSOrg() => create();
  factory BSOrg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BSOrg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BSOrg clone() => BSOrg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BSOrg copyWith(void Function(BSOrg) updates) => super.copyWith((message) => updates(message as BSOrg)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BSOrg create() => BSOrg._();
  BSOrg createEmptyInstance() => create();
  static $pb.PbList<BSOrg> createRepeated() => $pb.PbList<BSOrg>();
  @$core.pragma('dart2js:noInline')
  static BSOrg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BSOrg>(create);
  static BSOrg _defaultInstance;

  @$pb.TagNumber(1)
  $2.OrgRequest get org => $_getN(0);
  @$pb.TagNumber(1)
  set org($2.OrgRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrg() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrg() => clearField(1);
  @$pb.TagNumber(1)
  $2.OrgRequest ensureOrg() => $_ensure(0);
}

class BSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BSRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..pc<BSOrg>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orgs', $pb.PbFieldType.PM, subBuilder: BSOrg.create)
    ..pc<BSProject>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projects', $pb.PbFieldType.PM, subBuilder: BSProject.create)
    ..pc<BSAccount>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'superusers', $pb.PbFieldType.PM, subBuilder: BSAccount.create)
    ..pc<BSRegularAccount>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regularUsers', $pb.PbFieldType.PM, subBuilder: BSRegularAccount.create)
    ..hasRequiredFields = false
  ;

  BSRequest._() : super();
  factory BSRequest() => create();
  factory BSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BSRequest clone() => BSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BSRequest copyWith(void Function(BSRequest) updates) => super.copyWith((message) => updates(message as BSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BSRequest create() => BSRequest._();
  BSRequest createEmptyInstance() => create();
  static $pb.PbList<BSRequest> createRepeated() => $pb.PbList<BSRequest>();
  @$core.pragma('dart2js:noInline')
  static BSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BSRequest>(create);
  static BSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BSOrg> get orgs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<BSProject> get projects => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<BSAccount> get superusers => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<BSRegularAccount> get regularUsers => $_getList(3);
}

class BSAccount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BSAccount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOM<$2.LoginRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initialSuperuser', subBuilder: $2.LoginRequest.create)
    ..hasRequiredFields = false
  ;

  BSAccount._() : super();
  factory BSAccount() => create();
  factory BSAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BSAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BSAccount clone() => BSAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BSAccount copyWith(void Function(BSAccount) updates) => super.copyWith((message) => updates(message as BSAccount)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BSAccount create() => BSAccount._();
  BSAccount createEmptyInstance() => create();
  static $pb.PbList<BSAccount> createRepeated() => $pb.PbList<BSAccount>();
  @$core.pragma('dart2js:noInline')
  static BSAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BSAccount>(create);
  static BSAccount _defaultInstance;

  @$pb.TagNumber(1)
  $2.LoginRequest get initialSuperuser => $_getN(0);
  @$pb.TagNumber(1)
  set initialSuperuser($2.LoginRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInitialSuperuser() => $_has(0);
  @$pb.TagNumber(1)
  void clearInitialSuperuser() => clearField(1);
  @$pb.TagNumber(1)
  $2.LoginRequest ensureInitialSuperuser() => $_ensure(0);
}

class BSRegularAccount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BSRegularAccount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOM<$2.AccountNewRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newAccounts', subBuilder: $2.AccountNewRequest.create)
    ..aOM<$3.NewSurveyUserRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surveyValue', subBuilder: $3.NewSurveyUserRequest.create)
    ..hasRequiredFields = false
  ;

  BSRegularAccount._() : super();
  factory BSRegularAccount() => create();
  factory BSRegularAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BSRegularAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BSRegularAccount clone() => BSRegularAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BSRegularAccount copyWith(void Function(BSRegularAccount) updates) => super.copyWith((message) => updates(message as BSRegularAccount)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BSRegularAccount create() => BSRegularAccount._();
  BSRegularAccount createEmptyInstance() => create();
  static $pb.PbList<BSRegularAccount> createRepeated() => $pb.PbList<BSRegularAccount>();
  @$core.pragma('dart2js:noInline')
  static BSRegularAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BSRegularAccount>(create);
  static BSRegularAccount _defaultInstance;

  @$pb.TagNumber(1)
  $2.AccountNewRequest get newAccounts => $_getN(0);
  @$pb.TagNumber(1)
  set newAccounts($2.AccountNewRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewAccounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewAccounts() => clearField(1);
  @$pb.TagNumber(1)
  $2.AccountNewRequest ensureNewAccounts() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.NewSurveyUserRequest get surveyValue => $_getN(1);
  @$pb.TagNumber(2)
  set surveyValue($3.NewSurveyUserRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurveyValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurveyValue() => clearField(2);
  @$pb.TagNumber(2)
  $3.NewSurveyUserRequest ensureSurveyValue() => $_ensure(1);
}

class NewBSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewBSRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileExtension')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bsRequest', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  NewBSRequest._() : super();
  factory NewBSRequest() => create();
  factory NewBSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewBSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewBSRequest clone() => NewBSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewBSRequest copyWith(void Function(NewBSRequest) updates) => super.copyWith((message) => updates(message as NewBSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewBSRequest create() => NewBSRequest._();
  NewBSRequest createEmptyInstance() => create();
  static $pb.PbList<NewBSRequest> createRepeated() => $pb.PbList<NewBSRequest>();
  @$core.pragma('dart2js:noInline')
  static NewBSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewBSRequest>(create);
  static NewBSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileExtension => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileExtension($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileExtension() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileExtension() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get bsRequest => $_getN(1);
  @$pb.TagNumber(2)
  set bsRequest($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBsRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearBsRequest() => clearField(2);
}

class NewBSResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewBSResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileId')
    ..hasRequiredFields = false
  ;

  NewBSResponse._() : super();
  factory NewBSResponse() => create();
  factory NewBSResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewBSResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewBSResponse clone() => NewBSResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewBSResponse copyWith(void Function(NewBSResponse) updates) => super.copyWith((message) => updates(message as NewBSResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewBSResponse create() => NewBSResponse._();
  NewBSResponse createEmptyInstance() => create();
  static $pb.PbList<NewBSResponse> createRepeated() => $pb.PbList<NewBSResponse>();
  @$core.pragma('dart2js:noInline')
  static NewBSResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewBSResponse>(create);
  static NewBSResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);
}

class GetBSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBSRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileId')
    ..hasRequiredFields = false
  ;

  GetBSRequest._() : super();
  factory GetBSRequest() => create();
  factory GetBSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBSRequest clone() => GetBSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBSRequest copyWith(void Function(GetBSRequest) updates) => super.copyWith((message) => updates(message as GetBSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBSRequest create() => GetBSRequest._();
  GetBSRequest createEmptyInstance() => create();
  static $pb.PbList<GetBSRequest> createRepeated() => $pb.PbList<GetBSRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBSRequest>(create);
  static GetBSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);
}

class BS extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BS', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileId')
    ..aOM<$4.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<BSRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: BSRequest.create)
    ..hasRequiredFields = false
  ;

  BS._() : super();
  factory BS() => create();
  factory BS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BS clone() => BS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BS copyWith(void Function(BS) updates) => super.copyWith((message) => updates(message as BS)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BS create() => BS._();
  BS createEmptyInstance() => create();
  static $pb.PbList<BS> createRepeated() => $pb.PbList<BS>();
  @$core.pragma('dart2js:noInline')
  static BS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BS>(create);
  static BS _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($4.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  BSRequest get content => $_getN(2);
  @$pb.TagNumber(3)
  set content(BSRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
  @$pb.TagNumber(3)
  BSRequest ensureContent() => $_ensure(2);
}

class ListBSResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBSResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..pc<BS>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bootstraps', $pb.PbFieldType.PM, subBuilder: BS.create)
    ..hasRequiredFields = false
  ;

  ListBSResponse._() : super();
  factory ListBSResponse() => create();
  factory ListBSResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBSResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBSResponse clone() => ListBSResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBSResponse copyWith(void Function(ListBSResponse) updates) => super.copyWith((message) => updates(message as ListBSResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBSResponse create() => ListBSResponse._();
  ListBSResponse createEmptyInstance() => create();
  static $pb.PbList<ListBSResponse> createRepeated() => $pb.PbList<ListBSResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBSResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBSResponse>(create);
  static ListBSResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BS> get bootstraps => $_getList(0);
}

class ListBSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBSRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'v2.main_bootstrap.services'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'perPageEntries')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPageId')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDescending', protoName: 'isDescending')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ListBSRequest._() : super();
  factory ListBSRequest() => create();
  factory ListBSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBSRequest clone() => ListBSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBSRequest copyWith(void Function(ListBSRequest) updates) => super.copyWith((message) => updates(message as ListBSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBSRequest create() => ListBSRequest._();
  ListBSRequest createEmptyInstance() => create();
  static $pb.PbList<ListBSRequest> createRepeated() => $pb.PbList<ListBSRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBSRequest>(create);
  static ListBSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get perPageEntries => $_getI64(0);
  @$pb.TagNumber(1)
  set perPageEntries($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerPageEntries() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerPageEntries() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderBy($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderBy() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentPageId => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentPageId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentPageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDescending => $_getBF(3);
  @$pb.TagNumber(4)
  set isDescending($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsDescending() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDescending() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get filters => $_getN(4);
  @$pb.TagNumber(5)
  set filters($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFilters() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilters() => clearField(5);
}

