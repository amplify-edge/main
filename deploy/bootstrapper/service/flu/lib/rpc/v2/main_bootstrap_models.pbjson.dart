///
//  Generated code. Do not modify.
//  source: main_bootstrap_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use bSProjectDescriptor instead')
const BSProject$json = const {
  '1': 'BSProject',
  '2': const [
    const {'1': 'project', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.ProjectRequest', '10': 'project'},
    const {'1': 'project_details', '3': 2, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewDiscoProjectRequest', '10': 'projectDetails'},
    const {'1': 'survey_schema', '3': 3, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewSurveyProjectRequest', '10': 'surveySchema'},
  ],
};

/// Descriptor for `BSProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSProjectDescriptor = $convert.base64Decode('CglCU1Byb2plY3QSQQoHcHJvamVjdBgBIAEoCzInLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLlByb2plY3RSZXF1ZXN0Ugdwcm9qZWN0ElYKD3Byb2plY3RfZGV0YWlscxgCIAEoCzItLnYyLm1vZF9kaXNjby5zZXJ2aWNlcy5OZXdEaXNjb1Byb2plY3RSZXF1ZXN0Ug5wcm9qZWN0RGV0YWlscxJTCg1zdXJ2ZXlfc2NoZW1hGAMgASgLMi4udjIubW9kX2Rpc2NvLnNlcnZpY2VzLk5ld1N1cnZleVByb2plY3RSZXF1ZXN0UgxzdXJ2ZXlTY2hlbWE=');
@$core.Deprecated('Use bSOrgDescriptor instead')
const BSOrg$json = const {
  '1': 'BSOrg',
  '2': const [
    const {'1': 'org', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.OrgRequest', '10': 'org'},
  ],
};

/// Descriptor for `BSOrg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSOrgDescriptor = $convert.base64Decode('CgVCU09yZxI1CgNvcmcYASABKAsyIy52Mi5zeXNfYWNjb3VudC5zZXJ2aWNlcy5PcmdSZXF1ZXN0UgNvcmc=');
@$core.Deprecated('Use bSRequestDescriptor instead')
const BSRequest$json = const {
  '1': 'BSRequest',
  '2': const [
    const {'1': 'orgs', '3': 1, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSOrg', '10': 'orgs'},
    const {'1': 'projects', '3': 2, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSProject', '10': 'projects'},
    const {'1': 'regular_users', '3': 4, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSRegularAccount', '10': 'regularUsers'},
  ],
};

/// Descriptor for `BSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSRequestDescriptor = $convert.base64Decode('CglCU1JlcXVlc3QSNQoEb3JncxgBIAMoCzIhLnYyLm1haW5fYm9vdHN0cmFwLnNlcnZpY2VzLkJTT3JnUgRvcmdzEkEKCHByb2plY3RzGAIgAygLMiUudjIubWFpbl9ib290c3RyYXAuc2VydmljZXMuQlNQcm9qZWN0Ughwcm9qZWN0cxJRCg1yZWd1bGFyX3VzZXJzGAQgAygLMiwudjIubWFpbl9ib290c3RyYXAuc2VydmljZXMuQlNSZWd1bGFyQWNjb3VudFIMcmVndWxhclVzZXJz');
@$core.Deprecated('Use bSAccountDescriptor instead')
const BSAccount$json = const {
  '1': 'BSAccount',
  '2': const [
    const {'1': 'initial_superuser', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.LoginRequest', '10': 'initialSuperuser'},
  ],
};

/// Descriptor for `BSAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSAccountDescriptor = $convert.base64Decode('CglCU0FjY291bnQSUgoRaW5pdGlhbF9zdXBlcnVzZXIYASABKAsyJS52Mi5zeXNfYWNjb3VudC5zZXJ2aWNlcy5Mb2dpblJlcXVlc3RSEGluaXRpYWxTdXBlcnVzZXI=');
@$core.Deprecated('Use bSRegularAccountDescriptor instead')
const BSRegularAccount$json = const {
  '1': 'BSRegularAccount',
  '2': const [
    const {'1': 'new_accounts', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.AccountNewRequest', '10': 'newAccounts'},
    const {'1': 'survey_value', '3': 2, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewSurveyUserRequest', '10': 'surveyValue'},
  ],
};

/// Descriptor for `BSRegularAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSRegularAccountDescriptor = $convert.base64Decode('ChBCU1JlZ3VsYXJBY2NvdW50Ek0KDG5ld19hY2NvdW50cxgBIAEoCzIqLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLkFjY291bnROZXdSZXF1ZXN0UgtuZXdBY2NvdW50cxJOCgxzdXJ2ZXlfdmFsdWUYAiABKAsyKy52Mi5tb2RfZGlzY28uc2VydmljZXMuTmV3U3VydmV5VXNlclJlcXVlc3RSC3N1cnZleVZhbHVl');
@$core.Deprecated('Use newBSRequestDescriptor instead')
const NewBSRequest$json = const {
  '1': 'NewBSRequest',
  '2': const [
    const {'1': 'file_extension', '3': 1, '4': 1, '5': 9, '10': 'fileExtension'},
    const {'1': 'bs_request', '3': 2, '4': 1, '5': 12, '10': 'bsRequest'},
  ],
};

/// Descriptor for `NewBSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newBSRequestDescriptor = $convert.base64Decode('CgxOZXdCU1JlcXVlc3QSJQoOZmlsZV9leHRlbnNpb24YASABKAlSDWZpbGVFeHRlbnNpb24SHQoKYnNfcmVxdWVzdBgCIAEoDFIJYnNSZXF1ZXN0');
@$core.Deprecated('Use newBSResponseDescriptor instead')
const NewBSResponse$json = const {
  '1': 'NewBSResponse',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
  ],
};

/// Descriptor for `NewBSResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newBSResponseDescriptor = $convert.base64Decode('Cg1OZXdCU1Jlc3BvbnNlEhcKB2ZpbGVfaWQYASABKAlSBmZpbGVJZA==');
@$core.Deprecated('Use getBSRequestDescriptor instead')
const GetBSRequest$json = const {
  '1': 'GetBSRequest',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
  ],
};

/// Descriptor for `GetBSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBSRequestDescriptor = $convert.base64Decode('CgxHZXRCU1JlcXVlc3QSFwoHZmlsZV9pZBgBIAEoCVIGZmlsZUlk');
@$core.Deprecated('Use bSDescriptor instead')
const BS$json = const {
  '1': 'BS',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'content', '3': 3, '4': 1, '5': 11, '6': '.v2.main_bootstrap.services.BSRequest', '10': 'content'},
    const {'1': 'is_currently_active', '3': 4, '4': 1, '5': 8, '10': 'isCurrentlyActive'},
  ],
};

/// Descriptor for `BS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bSDescriptor = $convert.base64Decode('CgJCUxIXCgdmaWxlX2lkGAEgASgJUgZmaWxlSWQSOQoKY3JlYXRlZF9hdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI/Cgdjb250ZW50GAMgASgLMiUudjIubWFpbl9ib290c3RyYXAuc2VydmljZXMuQlNSZXF1ZXN0Ugdjb250ZW50Ei4KE2lzX2N1cnJlbnRseV9hY3RpdmUYBCABKAhSEWlzQ3VycmVudGx5QWN0aXZl');
@$core.Deprecated('Use listBSResponseDescriptor instead')
const ListBSResponse$json = const {
  '1': 'ListBSResponse',
  '2': const [
    const {'1': 'bootstraps', '3': 1, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BS', '10': 'bootstraps'},
  ],
};

/// Descriptor for `ListBSResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBSResponseDescriptor = $convert.base64Decode('Cg5MaXN0QlNSZXNwb25zZRI+Cgpib290c3RyYXBzGAEgAygLMh4udjIubWFpbl9ib290c3RyYXAuc2VydmljZXMuQlNSCmJvb3RzdHJhcHM=');
@$core.Deprecated('Use listBSRequestDescriptor instead')
const ListBSRequest$json = const {
  '1': 'ListBSRequest',
  '2': const [
    const {'1': 'per_page_entries', '3': 1, '4': 1, '5': 3, '10': 'perPageEntries'},
    const {'1': 'order_by', '3': 2, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'current_page_id', '3': 3, '4': 1, '5': 9, '10': 'currentPageId'},
    const {'1': 'isDescending', '3': 4, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'filters', '3': 5, '4': 1, '5': 12, '10': 'filters'},
  ],
};

/// Descriptor for `ListBSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBSRequestDescriptor = $convert.base64Decode('Cg1MaXN0QlNSZXF1ZXN0EigKEHBlcl9wYWdlX2VudHJpZXMYASABKANSDnBlclBhZ2VFbnRyaWVzEhkKCG9yZGVyX2J5GAIgASgJUgdvcmRlckJ5EiYKD2N1cnJlbnRfcGFnZV9pZBgDIAEoCVINY3VycmVudFBhZ2VJZBIiCgxpc0Rlc2NlbmRpbmcYBCABKAhSDGlzRGVzY2VuZGluZxIYCgdmaWx0ZXJzGAUgASgMUgdmaWx0ZXJz');
