///
//  Generated code. Do not modify.
//  source: vendor/github.com/amplify-edge/mod/mod-disco/proto/v2/mod_disco_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {'1': 'sys_account_ref_id', '3': 1, '4': 1, '5': 9, '10': 'sysAccountRefId'},
    const {'1': 'selected_country', '3': 2, '4': 1, '5': 9, '10': 'selectedCountry'},
    const {'1': 'selected_city', '3': 3, '4': 1, '5': 9, '10': 'selectedCity'},
    const {'1': 'selected_age_range', '3': 4, '4': 1, '5': 9, '10': 'selectedAgeRange'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode('CghVc2VySW5mbxIrChJzeXNfYWNjb3VudF9yZWZfaWQYASABKAlSD3N5c0FjY291bnRSZWZJZBIpChBzZWxlY3RlZF9jb3VudHJ5GAIgASgJUg9zZWxlY3RlZENvdW50cnkSIwoNc2VsZWN0ZWRfY2l0eRgDIAEoCVIMc2VsZWN0ZWRDaXR5EiwKEnNlbGVjdGVkX2FnZV9yYW5nZRgEIAEoCVIQc2VsZWN0ZWRBZ2VSYW5nZRI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');
@$core.Deprecated('Use newUserInfoDescriptor instead')
const NewUserInfo$json = const {
  '1': 'NewUserInfo',
  '2': const [
    const {'1': 'sys_account_ref_id', '3': 1, '4': 1, '5': 9, '10': 'sysAccountRefId'},
    const {'1': 'sys_account_ref_email', '3': 2, '4': 1, '5': 9, '10': 'sysAccountRefEmail'},
    const {'1': 'selected_country', '3': 3, '4': 1, '5': 9, '10': 'selectedCountry'},
    const {'1': 'selected_city', '3': 4, '4': 1, '5': 9, '10': 'selectedCity'},
    const {'1': 'selected_age_range', '3': 5, '4': 1, '5': 9, '10': 'selectedAgeRange'},
  ],
};

/// Descriptor for `NewUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserInfoDescriptor = $convert.base64Decode('CgtOZXdVc2VySW5mbxIrChJzeXNfYWNjb3VudF9yZWZfaWQYASABKAlSD3N5c0FjY291bnRSZWZJZBIxChVzeXNfYWNjb3VudF9yZWZfZW1haWwYAiABKAlSEnN5c0FjY291bnRSZWZFbWFpbBIpChBzZWxlY3RlZF9jb3VudHJ5GAMgASgJUg9zZWxlY3RlZENvdW50cnkSIwoNc2VsZWN0ZWRfY2l0eRgEIAEoCVIMc2VsZWN0ZWRDaXR5EiwKEnNlbGVjdGVkX2FnZV9yYW5nZRgFIAEoCVIQc2VsZWN0ZWRBZ2VSYW5nZQ==');
@$core.Deprecated('Use updateUserInfoDescriptor instead')
const UpdateUserInfo$json = const {
  '1': 'UpdateUserInfo',
  '2': const [
    const {'1': 'sys_account_ref_id', '3': 1, '4': 1, '5': 9, '10': 'sysAccountRefId'},
    const {'1': 'selected_country', '3': 2, '4': 1, '5': 9, '10': 'selectedCountry'},
    const {'1': 'selected_city', '3': 3, '4': 1, '5': 9, '10': 'selectedCity'},
    const {'1': 'selected_age_range', '3': 4, '4': 1, '5': 9, '10': 'selectedAgeRange'},
  ],
};

/// Descriptor for `UpdateUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoDescriptor = $convert.base64Decode('Cg5VcGRhdGVVc2VySW5mbxIrChJzeXNfYWNjb3VudF9yZWZfaWQYASABKAlSD3N5c0FjY291bnRSZWZJZBIpChBzZWxlY3RlZF9jb3VudHJ5GAIgASgJUg9zZWxlY3RlZENvdW50cnkSIwoNc2VsZWN0ZWRfY2l0eRgDIAEoCVIMc2VsZWN0ZWRDaXR5EiwKEnNlbGVjdGVkX2FnZV9yYW5nZRgEIAEoCVIQc2VsZWN0ZWRBZ2VSYW5nZQ==');
@$core.Deprecated('Use userInfoValuesDescriptor instead')
const UserInfoValues$json = const {
  '1': 'UserInfoValues',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'countries', '3': 2, '4': 3, '5': 9, '10': 'countries'},
    const {'1': 'cities', '3': 3, '4': 3, '5': 9, '10': 'cities'},
    const {'1': 'selected_age_ranges', '3': 4, '4': 3, '5': 9, '10': 'selectedAgeRanges'},
  ],
};

/// Descriptor for `UserInfoValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoValuesDescriptor = $convert.base64Decode('Cg5Vc2VySW5mb1ZhbHVlcxIOCgJpZBgBIAEoCVICaWQSHAoJY291bnRyaWVzGAIgAygJUgljb3VudHJpZXMSFgoGY2l0aWVzGAMgAygJUgZjaXRpZXMSLgoTc2VsZWN0ZWRfYWdlX3JhbmdlcxgEIAMoCVIRc2VsZWN0ZWRBZ2VSYW5nZXM=');
@$core.Deprecated('Use supportRoleTypeDescriptor instead')
const SupportRoleType$json = const {
  '1': 'SupportRoleType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'unit_of_measures', '3': 6, '4': 1, '5': 9, '10': 'unitOfMeasures'},
  ],
};

/// Descriptor for `SupportRoleType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportRoleTypeDescriptor = $convert.base64Decode('Cg9TdXBwb3J0Um9sZVR5cGUSDgoCaWQYASABKAlSAmlkEjEKFXN1cnZleV9wcm9qZWN0X3JlZl9pZBgCIAEoCVISc3VydmV5UHJvamVjdFJlZklkEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHY29tbWVudBgEIAEoCVIHY29tbWVudBIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SKAoQdW5pdF9vZl9tZWFzdXJlcxgGIAEoCVIOdW5pdE9mTWVhc3VyZXM=');
@$core.Deprecated('Use newSupportRoleTypeDescriptor instead')
const NewSupportRoleType$json = const {
  '1': 'NewSupportRoleType',
  '2': const [
    const {'1': 'survey_project_ref_id', '3': 1, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'survey_project_ref_name', '3': 2, '4': 1, '5': 9, '10': 'surveyProjectRefName'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'unit_of_measures', '3': 6, '4': 1, '5': 9, '10': 'unitOfMeasures'},
  ],
};

/// Descriptor for `NewSupportRoleType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newSupportRoleTypeDescriptor = $convert.base64Decode('ChJOZXdTdXBwb3J0Um9sZVR5cGUSMQoVc3VydmV5X3Byb2plY3RfcmVmX2lkGAEgASgJUhJzdXJ2ZXlQcm9qZWN0UmVmSWQSNQoXc3VydmV5X3Byb2plY3RfcmVmX25hbWUYAiABKAlSFHN1cnZleVByb2plY3RSZWZOYW1lEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHY29tbWVudBgEIAEoCVIHY29tbWVudBIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SKAoQdW5pdF9vZl9tZWFzdXJlcxgGIAEoCVIOdW5pdE9mTWVhc3VyZXM=');
@$core.Deprecated('Use supportRoleValueDescriptor instead')
const SupportRoleValue$json = const {
  '1': 'SupportRoleValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_user_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyUserRefId'},
    const {'1': 'support_role_type_ref_id', '3': 3, '4': 1, '5': 9, '10': 'supportRoleTypeRefId'},
    const {'1': 'pledged', '3': 4, '4': 1, '5': 4, '10': 'pledged'},
    const {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `SupportRoleValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportRoleValueDescriptor = $convert.base64Decode('ChBTdXBwb3J0Um9sZVZhbHVlEg4KAmlkGAEgASgJUgJpZBIrChJzdXJ2ZXlfdXNlcl9yZWZfaWQYAiABKAlSD3N1cnZleVVzZXJSZWZJZBI2ChhzdXBwb3J0X3JvbGVfdHlwZV9yZWZfaWQYAyABKAlSFHN1cHBvcnRSb2xlVHlwZVJlZklkEhgKB3BsZWRnZWQYBCABKARSB3BsZWRnZWQSGAoHY29tbWVudBgFIAEoCVIHY29tbWVudA==');
@$core.Deprecated('Use newSupportRoleValueDescriptor instead')
const NewSupportRoleValue$json = const {
  '1': 'NewSupportRoleValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_user_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyUserRefId'},
    const {'1': 'survey_user_ref_name', '3': 3, '4': 1, '5': 9, '10': 'surveyUserRefName'},
    const {'1': 'support_role_type_ref_id', '3': 4, '4': 1, '5': 9, '10': 'supportRoleTypeRefId'},
    const {'1': 'support_role_type_ref_name', '3': 5, '4': 1, '5': 9, '10': 'supportRoleTypeRefName'},
    const {'1': 'pledged', '3': 6, '4': 1, '5': 4, '10': 'pledged'},
    const {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `NewSupportRoleValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newSupportRoleValueDescriptor = $convert.base64Decode('ChNOZXdTdXBwb3J0Um9sZVZhbHVlEg4KAmlkGAEgASgJUgJpZBIrChJzdXJ2ZXlfdXNlcl9yZWZfaWQYAiABKAlSD3N1cnZleVVzZXJSZWZJZBIvChRzdXJ2ZXlfdXNlcl9yZWZfbmFtZRgDIAEoCVIRc3VydmV5VXNlclJlZk5hbWUSNgoYc3VwcG9ydF9yb2xlX3R5cGVfcmVmX2lkGAQgASgJUhRzdXBwb3J0Um9sZVR5cGVSZWZJZBI6ChpzdXBwb3J0X3JvbGVfdHlwZV9yZWZfbmFtZRgFIAEoCVIWc3VwcG9ydFJvbGVUeXBlUmVmTmFtZRIYCgdwbGVkZ2VkGAYgASgEUgdwbGVkZ2VkEhgKB2NvbW1lbnQYByABKAlSB2NvbW1lbnQ=');
@$core.Deprecated('Use userNeedsTypeDescriptor instead')
const UserNeedsType$json = const {
  '1': 'UserNeedsType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'unit_of_measures', '3': 6, '4': 1, '5': 9, '10': 'unitOfMeasures'},
    const {'1': 'question_group', '3': 7, '4': 1, '5': 9, '10': 'questionGroup'},
    const {'1': 'question_type', '3': 8, '4': 1, '5': 9, '10': 'questionType'},
    const {'1': 'dropdown_question', '3': 9, '4': 1, '5': 9, '10': 'dropdownQuestion'},
  ],
};

/// Descriptor for `UserNeedsType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userNeedsTypeDescriptor = $convert.base64Decode('Cg1Vc2VyTmVlZHNUeXBlEg4KAmlkGAEgASgJUgJpZBIxChVzdXJ2ZXlfcHJvamVjdF9yZWZfaWQYAiABKAlSEnN1cnZleVByb2plY3RSZWZJZBISCgRuYW1lGAMgASgJUgRuYW1lEhgKB2NvbW1lbnQYBCABKAlSB2NvbW1lbnQSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9uEigKEHVuaXRfb2ZfbWVhc3VyZXMYBiABKAlSDnVuaXRPZk1lYXN1cmVzEiUKDnF1ZXN0aW9uX2dyb3VwGAcgASgJUg1xdWVzdGlvbkdyb3VwEiMKDXF1ZXN0aW9uX3R5cGUYCCABKAlSDHF1ZXN0aW9uVHlwZRIrChFkcm9wZG93bl9xdWVzdGlvbhgJIAEoCVIQZHJvcGRvd25RdWVzdGlvbg==');
@$core.Deprecated('Use newUserNeedsTypeDescriptor instead')
const NewUserNeedsType$json = const {
  '1': 'NewUserNeedsType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'unit_of_measures', '3': 6, '4': 1, '5': 9, '10': 'unitOfMeasures'},
    const {'1': 'question_group', '3': 7, '4': 1, '5': 9, '10': 'questionGroup'},
    const {'1': 'question_type', '3': 8, '4': 1, '5': 9, '10': 'questionType'},
    const {'1': 'dropdown_question', '3': 9, '4': 1, '5': 9, '10': 'dropdownQuestion'},
  ],
};

/// Descriptor for `NewUserNeedsType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserNeedsTypeDescriptor = $convert.base64Decode('ChBOZXdVc2VyTmVlZHNUeXBlEg4KAmlkGAEgASgJUgJpZBIxChVzdXJ2ZXlfcHJvamVjdF9yZWZfaWQYAiABKAlSEnN1cnZleVByb2plY3RSZWZJZBISCgRuYW1lGAMgASgJUgRuYW1lEhgKB2NvbW1lbnQYBCABKAlSB2NvbW1lbnQSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9uEigKEHVuaXRfb2ZfbWVhc3VyZXMYBiABKAlSDnVuaXRPZk1lYXN1cmVzEiUKDnF1ZXN0aW9uX2dyb3VwGAcgASgJUg1xdWVzdGlvbkdyb3VwEiMKDXF1ZXN0aW9uX3R5cGUYCCABKAlSDHF1ZXN0aW9uVHlwZRIrChFkcm9wZG93bl9xdWVzdGlvbhgJIAEoCVIQZHJvcGRvd25RdWVzdGlvbg==');
@$core.Deprecated('Use userNeedsValueDescriptor instead')
const UserNeedsValue$json = const {
  '1': 'UserNeedsValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'survey_user_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyUserRefId'},
    const {'1': 'user_needs_type_ref_id', '3': 3, '4': 1, '5': 9, '10': 'userNeedsTypeRefId'},
    const {'1': 'comments', '3': 4, '4': 1, '5': 9, '10': 'comments'},
  ],
};

/// Descriptor for `UserNeedsValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userNeedsValueDescriptor = $convert.base64Decode('Cg5Vc2VyTmVlZHNWYWx1ZRIOCgJpZBgBIAEoCVICaWQSKwoSc3VydmV5X3VzZXJfcmVmX2lkGAIgASgJUg9zdXJ2ZXlVc2VyUmVmSWQSMgoWdXNlcl9uZWVkc190eXBlX3JlZl9pZBgDIAEoCVISdXNlck5lZWRzVHlwZVJlZklkEhoKCGNvbW1lbnRzGAQgASgJUghjb21tZW50cw==');
@$core.Deprecated('Use surveyValuePlusAccountDescriptor instead')
const SurveyValuePlusAccount$json = const {
  '1': 'SurveyValuePlusAccount',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sys_account_user_ref_name', '3': 2, '4': 1, '5': 9, '10': 'sysAccountUserRefName'},
    const {'1': 'pledged', '3': 3, '4': 1, '5': 4, '10': 'pledged'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `SurveyValuePlusAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List surveyValuePlusAccountDescriptor = $convert.base64Decode('ChZTdXJ2ZXlWYWx1ZVBsdXNBY2NvdW50Eg4KAmlkGAEgASgJUgJpZBI4ChlzeXNfYWNjb3VudF91c2VyX3JlZl9uYW1lGAIgASgJUhVzeXNBY2NvdW50VXNlclJlZk5hbWUSGAoHcGxlZGdlZBgDIAEoBFIHcGxlZGdlZBI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');
@$core.Deprecated('Use newUserNeedsValueDescriptor instead')
const NewUserNeedsValue$json = const {
  '1': 'NewUserNeedsValue',
  '2': const [
    const {'1': 'survey_user_ref_name', '3': 1, '4': 1, '5': 9, '10': 'surveyUserRefName'},
    const {'1': 'survey_user_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyUserRefId'},
    const {'1': 'user_needs_type_ref_id', '3': 3, '4': 1, '5': 9, '10': 'userNeedsTypeRefId'},
    const {'1': 'user_needs_type_ref_name', '3': 4, '4': 1, '5': 9, '10': 'userNeedsTypeRefName'},
    const {'1': 'comments', '3': 5, '4': 1, '5': 9, '10': 'comments'},
  ],
};

/// Descriptor for `NewUserNeedsValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserNeedsValueDescriptor = $convert.base64Decode('ChFOZXdVc2VyTmVlZHNWYWx1ZRIvChRzdXJ2ZXlfdXNlcl9yZWZfbmFtZRgBIAEoCVIRc3VydmV5VXNlclJlZk5hbWUSKwoSc3VydmV5X3VzZXJfcmVmX2lkGAIgASgJUg9zdXJ2ZXlVc2VyUmVmSWQSMgoWdXNlcl9uZWVkc190eXBlX3JlZl9pZBgDIAEoCVISdXNlck5lZWRzVHlwZVJlZklkEjYKGHVzZXJfbmVlZHNfdHlwZV9yZWZfbmFtZRgEIAEoCVIUdXNlck5lZWRzVHlwZVJlZk5hbWUSGgoIY29tbWVudHMYBSABKAlSCGNvbW1lbnRz');
@$core.Deprecated('Use surveyProjectDescriptor instead')
const SurveyProject$json = const {
  '1': 'SurveyProject',
  '2': const [
    const {'1': 'survey_project_id', '3': 1, '4': 1, '5': 9, '10': 'surveyProjectId'},
    const {'1': 'sys_account_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'sysAccountProjectRefId'},
    const {'1': 'support_role_types', '3': 3, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SupportRoleType', '10': 'supportRoleTypes'},
    const {'1': 'user_need_types', '3': 4, '4': 3, '5': 11, '6': '.v2.mod_disco.services.UserNeedsType', '10': 'userNeedTypes'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'survey_project_name', '3': 7, '4': 1, '5': 9, '10': 'surveyProjectName'},
  ],
};

/// Descriptor for `SurveyProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List surveyProjectDescriptor = $convert.base64Decode('Cg1TdXJ2ZXlQcm9qZWN0EioKEXN1cnZleV9wcm9qZWN0X2lkGAEgASgJUg9zdXJ2ZXlQcm9qZWN0SWQSOgoac3lzX2FjY291bnRfcHJvamVjdF9yZWZfaWQYAiABKAlSFnN5c0FjY291bnRQcm9qZWN0UmVmSWQSVAoSc3VwcG9ydF9yb2xlX3R5cGVzGAMgAygLMiYudjIubW9kX2Rpc2NvLnNlcnZpY2VzLlN1cHBvcnRSb2xlVHlwZVIQc3VwcG9ydFJvbGVUeXBlcxJMCg91c2VyX25lZWRfdHlwZXMYBCADKAsyJC52Mi5tb2RfZGlzY28uc2VydmljZXMuVXNlck5lZWRzVHlwZVINdXNlck5lZWRUeXBlcxI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSLgoTc3VydmV5X3Byb2plY3RfbmFtZRgHIAEoCVIRc3VydmV5UHJvamVjdE5hbWU=');
@$core.Deprecated('Use surveyUserDescriptor instead')
const SurveyUser$json = const {
  '1': 'SurveyUser',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {'1': 'survey_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'sys_account_account_ref_id', '3': 3, '4': 1, '5': 9, '10': 'sysAccountAccountRefId'},
    const {'1': 'support_role_values', '3': 4, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SupportRoleValue', '10': 'supportRoleValues'},
    const {'1': 'user_need_values', '3': 5, '4': 3, '5': 11, '6': '.v2.mod_disco.services.UserNeedsValue', '10': 'userNeedValues'},
    const {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'survey_project_ref_name', '3': 8, '4': 1, '5': 9, '10': 'surveyProjectRefName'},
    const {'1': 'survey_user_name', '3': 9, '4': 1, '5': 9, '10': 'surveyUserName'},
  ],
};

/// Descriptor for `SurveyUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List surveyUserDescriptor = $convert.base64Decode('CgpTdXJ2ZXlVc2VyEiQKDnN1cnZleV91c2VyX2lkGAEgASgJUgxzdXJ2ZXlVc2VySWQSMQoVc3VydmV5X3Byb2plY3RfcmVmX2lkGAIgASgJUhJzdXJ2ZXlQcm9qZWN0UmVmSWQSOgoac3lzX2FjY291bnRfYWNjb3VudF9yZWZfaWQYAyABKAlSFnN5c0FjY291bnRBY2NvdW50UmVmSWQSVwoTc3VwcG9ydF9yb2xlX3ZhbHVlcxgEIAMoCzInLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5TdXBwb3J0Um9sZVZhbHVlUhFzdXBwb3J0Um9sZVZhbHVlcxJPChB1c2VyX25lZWRfdmFsdWVzGAUgAygLMiUudjIubW9kX2Rpc2NvLnNlcnZpY2VzLlVzZXJOZWVkc1ZhbHVlUg51c2VyTmVlZFZhbHVlcxI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSNQoXc3VydmV5X3Byb2plY3RfcmVmX25hbWUYCCABKAlSFHN1cnZleVByb2plY3RSZWZOYW1lEigKEHN1cnZleV91c2VyX25hbWUYCSABKAlSDnN1cnZleVVzZXJOYW1l');
@$core.Deprecated('Use discoProjectDescriptor instead')
const DiscoProject$json = const {
  '1': 'DiscoProject',
  '2': const [
    const {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'sys_account_project_ref_id', '3': 2, '4': 1, '5': 9, '10': 'sysAccountProjectRefId'},
    const {'1': 'sys_account_org_ref_id', '3': 3, '4': 1, '5': 9, '10': 'sysAccountOrgRefId'},
    const {'1': 'goal', '3': 4, '4': 1, '5': 9, '10': 'goal'},
    const {'1': 'already_pledged', '3': 5, '4': 1, '5': 4, '10': 'alreadyPledged'},
    const {'1': 'action_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'actionTime'},
    const {'1': 'action_location', '3': 7, '4': 1, '5': 9, '10': 'actionLocation'},
    const {'1': 'min_pioneers', '3': 8, '4': 1, '5': 4, '10': 'minPioneers'},
    const {'1': 'min_rebels_media', '3': 9, '4': 1, '5': 4, '10': 'minRebelsMedia'},
    const {'1': 'min_rebels_to_win', '3': 10, '4': 1, '5': 4, '10': 'minRebelsToWin'},
    const {'1': 'action_length', '3': 11, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 12, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 14, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 15, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'hist_precedents', '3': 16, '4': 1, '5': 9, '10': 'histPrecedents'},
    const {'1': 'strategy', '3': 17, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 18, '4': 3, '5': 9, '10': 'videoUrl'},
    const {'1': 'unit_of_measures', '3': 19, '4': 1, '5': 9, '10': 'unitOfMeasures'},
    const {'1': 'created_at', '3': 20, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 21, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'image_resource_ids', '3': 22, '4': 3, '5': 9, '10': 'imageResourceIds'},
    const {'1': 'project_images', '3': 23, '4': 3, '5': 12, '10': 'projectImages'},
  ],
};

/// Descriptor for `DiscoProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoProjectDescriptor = $convert.base64Decode('CgxEaXNjb1Byb2plY3QSHQoKcHJvamVjdF9pZBgBIAEoCVIJcHJvamVjdElkEjoKGnN5c19hY2NvdW50X3Byb2plY3RfcmVmX2lkGAIgASgJUhZzeXNBY2NvdW50UHJvamVjdFJlZklkEjIKFnN5c19hY2NvdW50X29yZ19yZWZfaWQYAyABKAlSEnN5c0FjY291bnRPcmdSZWZJZBISCgRnb2FsGAQgASgJUgRnb2FsEicKD2FscmVhZHlfcGxlZGdlZBgFIAEoBFIOYWxyZWFkeVBsZWRnZWQSOwoLYWN0aW9uX3RpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgphY3Rpb25UaW1lEicKD2FjdGlvbl9sb2NhdGlvbhgHIAEoCVIOYWN0aW9uTG9jYXRpb24SIQoMbWluX3Bpb25lZXJzGAggASgEUgttaW5QaW9uZWVycxIoChBtaW5fcmViZWxzX21lZGlhGAkgASgEUg5taW5SZWJlbHNNZWRpYRIpChFtaW5fcmViZWxzX3RvX3dpbhgKIAEoBFIObWluUmViZWxzVG9XaW4SIwoNYWN0aW9uX2xlbmd0aBgLIAEoCVIMYWN0aW9uTGVuZ3RoEh8KC2FjdGlvbl90eXBlGAwgASgJUgphY3Rpb25UeXBlEhoKCGNhdGVnb3J5GA4gASgJUghjYXRlZ29yeRIYCgdjb250YWN0GA8gASgJUgdjb250YWN0EicKD2hpc3RfcHJlY2VkZW50cxgQIAEoCVIOaGlzdFByZWNlZGVudHMSGgoIc3RyYXRlZ3kYESABKAlSCHN0cmF0ZWd5EhsKCXZpZGVvX3VybBgSIAMoCVIIdmlkZW9VcmwSKAoQdW5pdF9vZl9tZWFzdXJlcxgTIAEoCVIOdW5pdE9mTWVhc3VyZXMSOQoKY3JlYXRlZF9hdBgUIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GBUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EiwKEmltYWdlX3Jlc291cmNlX2lkcxgWIAMoCVIQaW1hZ2VSZXNvdXJjZUlkcxIlCg5wcm9qZWN0X2ltYWdlcxgXIAMoDFINcHJvamVjdEltYWdlcw==');
@$core.Deprecated('Use newDiscoProjectRequestDescriptor instead')
const NewDiscoProjectRequest$json = const {
  '1': 'NewDiscoProjectRequest',
  '2': const [
    const {'1': 'sys_account_project_ref_id', '3': 1, '4': 1, '5': 9, '10': 'sysAccountProjectRefId'},
    const {'1': 'sys_account_org_ref_id', '3': 2, '4': 1, '5': 9, '10': 'sysAccountOrgRefId'},
    const {'1': 'goal', '3': 3, '4': 1, '5': 9, '10': 'goal'},
    const {'1': 'already_pledged', '3': 4, '4': 1, '5': 4, '10': 'alreadyPledged'},
    const {'1': 'action_time_nano', '3': 5, '4': 1, '5': 3, '10': 'actionTimeNano'},
    const {'1': 'action_location', '3': 6, '4': 1, '5': 9, '10': 'actionLocation'},
    const {'1': 'min_pioneers', '3': 7, '4': 1, '5': 4, '10': 'minPioneers'},
    const {'1': 'min_rebels_media', '3': 8, '4': 1, '5': 4, '10': 'minRebelsMedia'},
    const {'1': 'min_rebels_to_win', '3': 9, '4': 1, '5': 4, '10': 'minRebelsToWin'},
    const {'1': 'action_length', '3': 10, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 11, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 12, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 13, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'hist_precedents', '3': 14, '4': 1, '5': 9, '10': 'histPrecedents'},
    const {'1': 'strategy', '3': 15, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 16, '4': 3, '5': 9, '10': 'videoUrl'},
    const {'1': 'unit_of_measures', '3': 17, '4': 1, '5': 9, '10': 'unitOfMeasures'},
    const {'1': 'sys_account_project_ref_name', '3': 18, '4': 1, '5': 9, '10': 'sysAccountProjectRefName'},
    const {'1': 'sys_account_org_ref_name', '3': 19, '4': 1, '5': 9, '10': 'sysAccountOrgRefName'},
    const {'1': 'image_filepath', '3': 20, '4': 3, '5': 9, '10': 'imageFilepath'},
    const {'1': 'image_upload_arrays', '3': 21, '4': 3, '5': 9, '10': 'imageUploadArrays'},
  ],
};

/// Descriptor for `NewDiscoProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newDiscoProjectRequestDescriptor = $convert.base64Decode('ChZOZXdEaXNjb1Byb2plY3RSZXF1ZXN0EjoKGnN5c19hY2NvdW50X3Byb2plY3RfcmVmX2lkGAEgASgJUhZzeXNBY2NvdW50UHJvamVjdFJlZklkEjIKFnN5c19hY2NvdW50X29yZ19yZWZfaWQYAiABKAlSEnN5c0FjY291bnRPcmdSZWZJZBISCgRnb2FsGAMgASgJUgRnb2FsEicKD2FscmVhZHlfcGxlZGdlZBgEIAEoBFIOYWxyZWFkeVBsZWRnZWQSKAoQYWN0aW9uX3RpbWVfbmFubxgFIAEoA1IOYWN0aW9uVGltZU5hbm8SJwoPYWN0aW9uX2xvY2F0aW9uGAYgASgJUg5hY3Rpb25Mb2NhdGlvbhIhCgxtaW5fcGlvbmVlcnMYByABKARSC21pblBpb25lZXJzEigKEG1pbl9yZWJlbHNfbWVkaWEYCCABKARSDm1pblJlYmVsc01lZGlhEikKEW1pbl9yZWJlbHNfdG9fd2luGAkgASgEUg5taW5SZWJlbHNUb1dpbhIjCg1hY3Rpb25fbGVuZ3RoGAogASgJUgxhY3Rpb25MZW5ndGgSHwoLYWN0aW9uX3R5cGUYCyABKAlSCmFjdGlvblR5cGUSGgoIY2F0ZWdvcnkYDCABKAlSCGNhdGVnb3J5EhgKB2NvbnRhY3QYDSABKAlSB2NvbnRhY3QSJwoPaGlzdF9wcmVjZWRlbnRzGA4gASgJUg5oaXN0UHJlY2VkZW50cxIaCghzdHJhdGVneRgPIAEoCVIIc3RyYXRlZ3kSGwoJdmlkZW9fdXJsGBAgAygJUgh2aWRlb1VybBIoChB1bml0X29mX21lYXN1cmVzGBEgASgJUg51bml0T2ZNZWFzdXJlcxI+ChxzeXNfYWNjb3VudF9wcm9qZWN0X3JlZl9uYW1lGBIgASgJUhhzeXNBY2NvdW50UHJvamVjdFJlZk5hbWUSNgoYc3lzX2FjY291bnRfb3JnX3JlZl9uYW1lGBMgASgJUhRzeXNBY2NvdW50T3JnUmVmTmFtZRIlCg5pbWFnZV9maWxlcGF0aBgUIAMoCVINaW1hZ2VGaWxlcGF0aBIuChNpbWFnZV91cGxvYWRfYXJyYXlzGBUgAygJUhFpbWFnZVVwbG9hZEFycmF5cw==');
@$core.Deprecated('Use updateDiscoProjectRequestDescriptor instead')
const UpdateDiscoProjectRequest$json = const {
  '1': 'UpdateDiscoProjectRequest',
  '2': const [
    const {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'goal', '3': 2, '4': 1, '5': 9, '10': 'goal'},
    const {'1': 'already_pledged', '3': 3, '4': 1, '5': 4, '10': 'alreadyPledged'},
    const {'1': 'action_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'actionTime'},
    const {'1': 'action_location', '3': 5, '4': 1, '5': 9, '10': 'actionLocation'},
    const {'1': 'min_pioneers', '3': 6, '4': 1, '5': 4, '10': 'minPioneers'},
    const {'1': 'min_rebels_media', '3': 7, '4': 1, '5': 4, '10': 'minRebelsMedia'},
    const {'1': 'min_rebels_to_win', '3': 8, '4': 1, '5': 4, '10': 'minRebelsToWin'},
    const {'1': 'action_length', '3': 9, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 10, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 11, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 12, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'hist_precedents', '3': 13, '4': 1, '5': 9, '10': 'histPrecedents'},
    const {'1': 'strategy', '3': 14, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 15, '4': 1, '5': 9, '10': 'videoUrl'},
    const {'1': 'unit_of_measures', '3': 16, '4': 1, '5': 9, '10': 'unitOfMeasures'},
    const {'1': 'image_uploads', '3': 17, '4': 3, '5': 12, '10': 'imageUploads'},
    const {'1': 'image_resource_ids', '3': 18, '4': 3, '5': 9, '10': 'imageResourceIds'},
  ],
};

/// Descriptor for `UpdateDiscoProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDiscoProjectRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVEaXNjb1Byb2plY3RSZXF1ZXN0Eh0KCnByb2plY3RfaWQYASABKAlSCXByb2plY3RJZBISCgRnb2FsGAIgASgJUgRnb2FsEicKD2FscmVhZHlfcGxlZGdlZBgDIAEoBFIOYWxyZWFkeVBsZWRnZWQSOwoLYWN0aW9uX3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgphY3Rpb25UaW1lEicKD2FjdGlvbl9sb2NhdGlvbhgFIAEoCVIOYWN0aW9uTG9jYXRpb24SIQoMbWluX3Bpb25lZXJzGAYgASgEUgttaW5QaW9uZWVycxIoChBtaW5fcmViZWxzX21lZGlhGAcgASgEUg5taW5SZWJlbHNNZWRpYRIpChFtaW5fcmViZWxzX3RvX3dpbhgIIAEoBFIObWluUmViZWxzVG9XaW4SIwoNYWN0aW9uX2xlbmd0aBgJIAEoCVIMYWN0aW9uTGVuZ3RoEh8KC2FjdGlvbl90eXBlGAogASgJUgphY3Rpb25UeXBlEhoKCGNhdGVnb3J5GAsgASgJUghjYXRlZ29yeRIYCgdjb250YWN0GAwgASgJUgdjb250YWN0EicKD2hpc3RfcHJlY2VkZW50cxgNIAEoCVIOaGlzdFByZWNlZGVudHMSGgoIc3RyYXRlZ3kYDiABKAlSCHN0cmF0ZWd5EhsKCXZpZGVvX3VybBgPIAEoCVIIdmlkZW9VcmwSKAoQdW5pdF9vZl9tZWFzdXJlcxgQIAEoCVIOdW5pdE9mTWVhc3VyZXMSIwoNaW1hZ2VfdXBsb2FkcxgRIAMoDFIMaW1hZ2VVcGxvYWRzEiwKEmltYWdlX3Jlc291cmNlX2lkcxgSIAMoCVIQaW1hZ2VSZXNvdXJjZUlkcw==');
@$core.Deprecated('Use idRequestDescriptor instead')
const IdRequest$json = const {
  '1': 'IdRequest',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {'1': 'sys_account_project_id', '3': 2, '4': 1, '5': 9, '10': 'sysAccountProjectId'},
    const {'1': 'survey_project_id', '3': 3, '4': 1, '5': 9, '10': 'surveyProjectId'},
    const {'1': 'sys_account_account_id', '3': 4, '4': 1, '5': 9, '10': 'sysAccountAccountId'},
    const {'1': 'disco_project_id', '3': 5, '4': 1, '5': 9, '10': 'discoProjectId'},
    const {'1': 'sys_account_org_id', '3': 6, '4': 1, '5': 9, '10': 'sysAccountOrgId'},
  ],
};

/// Descriptor for `IdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idRequestDescriptor = $convert.base64Decode('CglJZFJlcXVlc3QSJAoOc3VydmV5X3VzZXJfaWQYASABKAlSDHN1cnZleVVzZXJJZBIzChZzeXNfYWNjb3VudF9wcm9qZWN0X2lkGAIgASgJUhNzeXNBY2NvdW50UHJvamVjdElkEioKEXN1cnZleV9wcm9qZWN0X2lkGAMgASgJUg9zdXJ2ZXlQcm9qZWN0SWQSMwoWc3lzX2FjY291bnRfYWNjb3VudF9pZBgEIAEoCVITc3lzQWNjb3VudEFjY291bnRJZBIoChBkaXNjb19wcm9qZWN0X2lkGAUgASgJUg5kaXNjb1Byb2plY3RJZBIrChJzeXNfYWNjb3VudF9vcmdfaWQYBiABKAlSD3N5c0FjY291bnRPcmdJZA==');
@$core.Deprecated('Use listRequestDescriptor instead')
const ListRequest$json = const {
  '1': 'ListRequest',
  '2': const [
    const {'1': 'id_request', '3': 1, '4': 1, '5': 11, '6': '.v2.mod_disco.services.IdRequest', '10': 'idRequest'},
    const {'1': 'per_page_entries', '3': 2, '4': 1, '5': 3, '10': 'perPageEntries'},
    const {'1': 'order_by', '3': 3, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'current_page_id', '3': 4, '4': 1, '5': 9, '10': 'currentPageId'},
    const {'1': 'filters', '3': 5, '4': 1, '5': 12, '10': 'filters'},
    const {'1': 'isDescending', '3': 6, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'matcher', '3': 7, '4': 1, '5': 9, '10': 'matcher'},
  ],
};

/// Descriptor for `ListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRequestDescriptor = $convert.base64Decode('CgtMaXN0UmVxdWVzdBI/CgppZF9yZXF1ZXN0GAEgASgLMiAudjIubW9kX2Rpc2NvLnNlcnZpY2VzLklkUmVxdWVzdFIJaWRSZXF1ZXN0EigKEHBlcl9wYWdlX2VudHJpZXMYAiABKANSDnBlclBhZ2VFbnRyaWVzEhkKCG9yZGVyX2J5GAMgASgJUgdvcmRlckJ5EiYKD2N1cnJlbnRfcGFnZV9pZBgEIAEoCVINY3VycmVudFBhZ2VJZBIYCgdmaWx0ZXJzGAUgASgMUgdmaWx0ZXJzEiIKDGlzRGVzY2VuZGluZxgGIAEoCFIMaXNEZXNjZW5kaW5nEhgKB21hdGNoZXIYByABKAlSB21hdGNoZXI=');
@$core.Deprecated('Use listResponseDescriptor instead')
const ListResponse$json = const {
  '1': 'ListResponse',
  '2': const [
    const {'1': 'survey_projects', '3': 1, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SurveyProject', '10': 'surveyProjects'},
    const {'1': 'survey_users', '3': 2, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SurveyUser', '10': 'surveyUsers'},
    const {'1': 'next_page_id', '3': 3, '4': 1, '5': 3, '10': 'nextPageId'},
    const {'1': 'disco_projects', '3': 4, '4': 3, '5': 11, '6': '.v2.mod_disco.services.DiscoProject', '10': 'discoProjects'},
  ],
};

/// Descriptor for `ListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listResponseDescriptor = $convert.base64Decode('CgxMaXN0UmVzcG9uc2USTQoPc3VydmV5X3Byb2plY3RzGAEgAygLMiQudjIubW9kX2Rpc2NvLnNlcnZpY2VzLlN1cnZleVByb2plY3RSDnN1cnZleVByb2plY3RzEkQKDHN1cnZleV91c2VycxgCIAMoCzIhLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5TdXJ2ZXlVc2VyUgtzdXJ2ZXlVc2VycxIgCgxuZXh0X3BhZ2VfaWQYAyABKANSCm5leHRQYWdlSWQSSgoOZGlzY29fcHJvamVjdHMYBCADKAsyIy52Mi5tb2RfZGlzY28uc2VydmljZXMuRGlzY29Qcm9qZWN0Ug1kaXNjb1Byb2plY3Rz');
@$core.Deprecated('Use newSurveyProjectRequestDescriptor instead')
const NewSurveyProjectRequest$json = const {
  '1': 'NewSurveyProjectRequest',
  '2': const [
    const {'1': 'sys_account_project_ref_id', '3': 1, '4': 1, '5': 9, '10': 'sysAccountProjectRefId'},
    const {'1': 'support_role_types', '3': 2, '4': 3, '5': 11, '6': '.v2.mod_disco.services.NewSupportRoleType', '10': 'supportRoleTypes'},
    const {'1': 'user_need_types', '3': 3, '4': 3, '5': 11, '6': '.v2.mod_disco.services.NewUserNeedsType', '10': 'userNeedTypes'},
    const {'1': 'sys_account_project_ref_name', '3': 4, '4': 1, '5': 9, '10': 'sysAccountProjectRefName'},
    const {'1': 'survey_project_name', '3': 5, '4': 1, '5': 9, '10': 'surveyProjectName'},
  ],
};

/// Descriptor for `NewSurveyProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newSurveyProjectRequestDescriptor = $convert.base64Decode('ChdOZXdTdXJ2ZXlQcm9qZWN0UmVxdWVzdBI6ChpzeXNfYWNjb3VudF9wcm9qZWN0X3JlZl9pZBgBIAEoCVIWc3lzQWNjb3VudFByb2plY3RSZWZJZBJXChJzdXBwb3J0X3JvbGVfdHlwZXMYAiADKAsyKS52Mi5tb2RfZGlzY28uc2VydmljZXMuTmV3U3VwcG9ydFJvbGVUeXBlUhBzdXBwb3J0Um9sZVR5cGVzEk8KD3VzZXJfbmVlZF90eXBlcxgDIAMoCzInLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5OZXdVc2VyTmVlZHNUeXBlUg11c2VyTmVlZFR5cGVzEj4KHHN5c19hY2NvdW50X3Byb2plY3RfcmVmX25hbWUYBCABKAlSGHN5c0FjY291bnRQcm9qZWN0UmVmTmFtZRIuChNzdXJ2ZXlfcHJvamVjdF9uYW1lGAUgASgJUhFzdXJ2ZXlQcm9qZWN0TmFtZQ==');
@$core.Deprecated('Use newSurveyUserRequestDescriptor instead')
const NewSurveyUserRequest$json = const {
  '1': 'NewSurveyUserRequest',
  '2': const [
    const {'1': 'survey_project_ref_id', '3': 1, '4': 1, '5': 9, '10': 'surveyProjectRefId'},
    const {'1': 'sys_account_user_ref_id', '3': 2, '4': 1, '5': 9, '10': 'sysAccountUserRefId'},
    const {'1': 'support_role_values', '3': 3, '4': 3, '5': 11, '6': '.v2.mod_disco.services.NewSupportRoleValue', '10': 'supportRoleValues'},
    const {'1': 'user_need_values', '3': 4, '4': 3, '5': 11, '6': '.v2.mod_disco.services.NewUserNeedsValue', '10': 'userNeedValues'},
    const {'1': 'survey_project_ref_name', '3': 5, '4': 1, '5': 9, '10': 'surveyProjectRefName'},
    const {'1': 'sys_account_user_ref_name', '3': 6, '4': 1, '5': 9, '10': 'sysAccountUserRefName'},
    const {'1': 'survey_user_name', '3': 7, '4': 1, '5': 9, '10': 'surveyUserName'},
  ],
};

/// Descriptor for `NewSurveyUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newSurveyUserRequestDescriptor = $convert.base64Decode('ChROZXdTdXJ2ZXlVc2VyUmVxdWVzdBIxChVzdXJ2ZXlfcHJvamVjdF9yZWZfaWQYASABKAlSEnN1cnZleVByb2plY3RSZWZJZBI0ChdzeXNfYWNjb3VudF91c2VyX3JlZl9pZBgCIAEoCVITc3lzQWNjb3VudFVzZXJSZWZJZBJaChNzdXBwb3J0X3JvbGVfdmFsdWVzGAMgAygLMioudjIubW9kX2Rpc2NvLnNlcnZpY2VzLk5ld1N1cHBvcnRSb2xlVmFsdWVSEXN1cHBvcnRSb2xlVmFsdWVzElIKEHVzZXJfbmVlZF92YWx1ZXMYBCADKAsyKC52Mi5tb2RfZGlzY28uc2VydmljZXMuTmV3VXNlck5lZWRzVmFsdWVSDnVzZXJOZWVkVmFsdWVzEjUKF3N1cnZleV9wcm9qZWN0X3JlZl9uYW1lGAUgASgJUhRzdXJ2ZXlQcm9qZWN0UmVmTmFtZRI4ChlzeXNfYWNjb3VudF91c2VyX3JlZl9uYW1lGAYgASgJUhVzeXNBY2NvdW50VXNlclJlZk5hbWUSKAoQc3VydmV5X3VzZXJfbmFtZRgHIAEoCVIOc3VydmV5VXNlck5hbWU=');
@$core.Deprecated('Use updateSurveyProjectRequestDescriptor instead')
const UpdateSurveyProjectRequest$json = const {
  '1': 'UpdateSurveyProjectRequest',
  '2': const [
    const {'1': 'survey_project_id', '3': 1, '4': 1, '5': 9, '10': 'surveyProjectId'},
    const {'1': 'support_role_types', '3': 2, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SupportRoleType', '10': 'supportRoleTypes'},
    const {'1': 'user_need_types', '3': 3, '4': 3, '5': 11, '6': '.v2.mod_disco.services.UserNeedsType', '10': 'userNeedTypes'},
  ],
};

/// Descriptor for `UpdateSurveyProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSurveyProjectRequestDescriptor = $convert.base64Decode('ChpVcGRhdGVTdXJ2ZXlQcm9qZWN0UmVxdWVzdBIqChFzdXJ2ZXlfcHJvamVjdF9pZBgBIAEoCVIPc3VydmV5UHJvamVjdElkElQKEnN1cHBvcnRfcm9sZV90eXBlcxgCIAMoCzImLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5TdXBwb3J0Um9sZVR5cGVSEHN1cHBvcnRSb2xlVHlwZXMSTAoPdXNlcl9uZWVkX3R5cGVzGAMgAygLMiQudjIubW9kX2Rpc2NvLnNlcnZpY2VzLlVzZXJOZWVkc1R5cGVSDXVzZXJOZWVkVHlwZXM=');
@$core.Deprecated('Use updateSurveyUserRequestDescriptor instead')
const UpdateSurveyUserRequest$json = const {
  '1': 'UpdateSurveyUserRequest',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {'1': 'support_role_values', '3': 2, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SupportRoleValue', '10': 'supportRoleValues'},
    const {'1': 'user_need_values', '3': 3, '4': 3, '5': 11, '6': '.v2.mod_disco.services.UserNeedsValue', '10': 'userNeedValues'},
  ],
};

/// Descriptor for `UpdateSurveyUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSurveyUserRequestDescriptor = $convert.base64Decode('ChdVcGRhdGVTdXJ2ZXlVc2VyUmVxdWVzdBIkCg5zdXJ2ZXlfdXNlcl9pZBgBIAEoCVIMc3VydmV5VXNlcklkElcKE3N1cHBvcnRfcm9sZV92YWx1ZXMYAiADKAsyJy52Mi5tb2RfZGlzY28uc2VydmljZXMuU3VwcG9ydFJvbGVWYWx1ZVIRc3VwcG9ydFJvbGVWYWx1ZXMSTwoQdXNlcl9uZWVkX3ZhbHVlcxgDIAMoCzIlLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5Vc2VyTmVlZHNWYWx1ZVIOdXNlck5lZWRWYWx1ZXM=');
@$core.Deprecated('Use genIdResponseDescriptor instead')
const GenIdResponse$json = const {
  '1': 'GenIdResponse',
  '2': const [
    const {'1': 'temp_id', '3': 1, '4': 1, '5': 9, '10': 'tempId'},
  ],
};

/// Descriptor for `GenIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genIdResponseDescriptor = $convert.base64Decode('Cg1HZW5JZFJlc3BvbnNlEhcKB3RlbXBfaWQYASABKAlSBnRlbXBJZA==');
@$core.Deprecated('Use statisticRequestDescriptor instead')
const StatisticRequest$json = const {
  '1': 'StatisticRequest',
  '2': const [
    const {'1': 'table_name', '3': 1, '4': 1, '5': 9, '10': 'tableName'},
    const {'1': 'include_counts', '3': 2, '4': 1, '5': 8, '10': 'includeCounts'},
    const {'1': 'filters', '3': 3, '4': 1, '5': 12, '10': 'filters'},
    const {'1': 'current_page_id', '3': 4, '4': 1, '5': 9, '10': 'currentPageId'},
    const {'1': 'limit', '3': 5, '4': 1, '5': 3, '10': 'limit'},
    const {'1': 'order_by', '3': 6, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'is_descending', '3': 7, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'per_page_entries', '3': 8, '4': 1, '5': 3, '10': 'perPageEntries'},
  ],
};

/// Descriptor for `StatisticRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statisticRequestDescriptor = $convert.base64Decode('ChBTdGF0aXN0aWNSZXF1ZXN0Eh0KCnRhYmxlX25hbWUYASABKAlSCXRhYmxlTmFtZRIlCg5pbmNsdWRlX2NvdW50cxgCIAEoCFINaW5jbHVkZUNvdW50cxIYCgdmaWx0ZXJzGAMgASgMUgdmaWx0ZXJzEiYKD2N1cnJlbnRfcGFnZV9pZBgEIAEoCVINY3VycmVudFBhZ2VJZBIUCgVsaW1pdBgFIAEoA1IFbGltaXQSGQoIb3JkZXJfYnkYBiABKAlSB29yZGVyQnkSIwoNaXNfZGVzY2VuZGluZxgHIAEoCFIMaXNEZXNjZW5kaW5nEigKEHBlcl9wYWdlX2VudHJpZXMYCCABKANSDnBlclBhZ2VFbnRyaWVz');
@$core.Deprecated('Use statisticResponseDescriptor instead')
const StatisticResponse$json = const {
  '1': 'StatisticResponse',
  '2': const [
    const {'1': 'survey_value_plus_account', '3': 1, '4': 3, '5': 11, '6': '.v2.mod_disco.services.SurveyValuePlusAccount', '10': 'surveyValuePlusAccount'},
    const {'1': 'next_page_id', '3': 2, '4': 1, '5': 9, '10': 'nextPageId'},
    const {'1': 'total_count', '3': 3, '4': 1, '5': 3, '10': 'totalCount'},
  ],
};

/// Descriptor for `StatisticResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statisticResponseDescriptor = $convert.base64Decode('ChFTdGF0aXN0aWNSZXNwb25zZRJoChlzdXJ2ZXlfdmFsdWVfcGx1c19hY2NvdW50GAEgAygLMi0udjIubW9kX2Rpc2NvLnNlcnZpY2VzLlN1cnZleVZhbHVlUGx1c0FjY291bnRSFnN1cnZleVZhbHVlUGx1c0FjY291bnQSIAoMbmV4dF9wYWdlX2lkGAIgASgJUgpuZXh0UGFnZUlkEh8KC3RvdGFsX2NvdW50GAMgASgDUgp0b3RhbENvdW50');
