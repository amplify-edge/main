///
//  Generated code. Do not modify.
//  source: vendor/github.com/amplify-edge/sys-share/sys-account/proto/v2/sys_account_models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use rolesDescriptor instead')
const Roles$json = const {
  '1': 'Roles',
  '2': const [
    const {'1': 'INVALID', '2': 0},
    const {'1': 'GUEST', '2': 1},
    const {'1': 'USER', '2': 2},
    const {'1': 'ADMIN', '2': 3},
    const {'1': 'SUPERADMIN', '2': 4},
  ],
};

/// Descriptor for `Roles`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rolesDescriptor = $convert.base64Decode('CgVSb2xlcxILCgdJTlZBTElEEAASCQoFR1VFU1QQARIICgRVU0VSEAISCQoFQURNSU4QAxIOCgpTVVBFUkFETUlOEAQ=');
@$core.Deprecated('Use userRolesDescriptor instead')
const UserRoles$json = const {
  '1': 'UserRoles',
  '2': const [
    const {'1': 'role', '3': 1, '4': 1, '5': 14, '6': '.v2.sys_account.services.Roles', '10': 'role'},
    const {'1': 'project_id', '3': 2, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'org_id', '3': 3, '4': 1, '5': 9, '10': 'orgId'},
  ],
};

/// Descriptor for `UserRoles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRolesDescriptor = $convert.base64Decode('CglVc2VyUm9sZXMSMgoEcm9sZRgBIAEoDjIeLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLlJvbGVzUgRyb2xlEh0KCnByb2plY3RfaWQYAiABKAlSCXByb2plY3RJZBIVCgZvcmdfaWQYAyABKAlSBW9yZ0lk');
@$core.Deprecated('Use errorReasonDescriptor instead')
const ErrorReason$json = const {
  '1': 'ErrorReason',
  '2': const [
    const {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `ErrorReason`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorReasonDescriptor = $convert.base64Decode('CgtFcnJvclJlYXNvbhIWCgZyZWFzb24YASABKAlSBnJlYXNvbg==');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'password_confirm', '3': 3, '4': 1, '5': 9, '10': 'passwordConfirm'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBIpChBwYXNzd29yZF9jb25maXJtGAMgASgJUg9wYXNzd29yZENvbmZpcm0=');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'error_reason', '3': 4, '4': 1, '5': 11, '6': '.v2.sys_account.services.ErrorReason', '10': 'errorReason'},
    const {'1': 'last_login', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastLogin'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoMYWNjZXNzX3Rva2VuGAIgASgJUgthY2Nlc3NUb2tlbhIjCg1yZWZyZXNoX3Rva2VuGAMgASgJUgxyZWZyZXNoVG9rZW4SRwoMZXJyb3JfcmVhc29uGAQgASgLMiQudjIuc3lzX2FjY291bnQuc2VydmljZXMuRXJyb3JSZWFzb25SC2Vycm9yUmVhc29uEjkKCmxhc3RfbG9naW4YBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglsYXN0TG9naW4=');
@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = const {
  '1': 'RegisterResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'success_msg', '3': 2, '4': 1, '5': 9, '10': 'successMsg'},
    const {'1': 'error_reason', '3': 3, '4': 1, '5': 11, '6': '.v2.sys_account.services.ErrorReason', '10': 'errorReason'},
    const {'1': 'verify_token', '3': 4, '4': 1, '5': 9, '10': 'verifyToken'},
    const {'1': 'temp_user_id', '3': 5, '4': 1, '5': 9, '10': 'tempUserId'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode('ChBSZWdpc3RlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHwoLc3VjY2Vzc19tc2cYAiABKAlSCnN1Y2Nlc3NNc2cSRwoMZXJyb3JfcmVhc29uGAMgASgLMiQudjIuc3lzX2FjY291bnQuc2VydmljZXMuRXJyb3JSZWFzb25SC2Vycm9yUmVhc29uEiEKDHZlcmlmeV90b2tlbhgEIAEoCVILdmVyaWZ5VG9rZW4SIAoMdGVtcF91c2VyX2lkGAUgASgJUgp0ZW1wVXNlcklk');
@$core.Deprecated('Use forgotPasswordRequestDescriptor instead')
const ForgotPasswordRequest$json = const {
  '1': 'ForgotPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ForgotPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordRequestDescriptor = $convert.base64Decode('ChVGb3Jnb3RQYXNzd29yZFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use forgotPasswordResponseDescriptor instead')
const ForgotPasswordResponse$json = const {
  '1': 'ForgotPasswordResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'success_msg', '3': 2, '4': 1, '5': 9, '10': 'successMsg'},
    const {'1': 'error_reason', '3': 3, '4': 1, '5': 11, '6': '.v2.sys_account.services.ErrorReason', '10': 'errorReason'},
    const {'1': 'forgot_password_requested_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'forgotPasswordRequestedAt'},
  ],
};

/// Descriptor for `ForgotPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordResponseDescriptor = $convert.base64Decode('ChZGb3Jnb3RQYXNzd29yZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHwoLc3VjY2Vzc19tc2cYAiABKAlSCnN1Y2Nlc3NNc2cSRwoMZXJyb3JfcmVhc29uGAMgASgLMiQudjIuc3lzX2FjY291bnQuc2VydmljZXMuRXJyb3JSZWFzb25SC2Vycm9yUmVhc29uElsKHGZvcmdvdF9wYXNzd29yZF9yZXF1ZXN0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhlmb3Jnb3RQYXNzd29yZFJlcXVlc3RlZEF0');
@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'password_confirm', '3': 3, '4': 1, '5': 9, '10': 'passwordConfirm'},
    const {'1': 'verify_token', '3': 4, '4': 1, '5': 9, '10': 'verifyToken'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEikKEHBhc3N3b3JkX2NvbmZpcm0YAyABKAlSD3Bhc3N3b3JkQ29uZmlybRIhCgx2ZXJpZnlfdG9rZW4YBCABKAlSC3ZlcmlmeVRva2Vu');
@$core.Deprecated('Use resetPasswordResponseDescriptor instead')
const ResetPasswordResponse$json = const {
  '1': 'ResetPasswordResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'success_msg', '3': 2, '4': 1, '5': 9, '10': 'successMsg'},
    const {'1': 'error_reason', '3': 3, '4': 1, '5': 11, '6': '.v2.sys_account.services.ErrorReason', '10': 'errorReason'},
    const {'1': 'reset_password_requested_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'resetPasswordRequestedAt'},
  ],
};

/// Descriptor for `ResetPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordResponseDescriptor = $convert.base64Decode('ChVSZXNldFBhc3N3b3JkUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIfCgtzdWNjZXNzX21zZxgCIAEoCVIKc3VjY2Vzc01zZxJHCgxlcnJvcl9yZWFzb24YAyABKAsyJC52Mi5zeXNfYWNjb3VudC5zZXJ2aWNlcy5FcnJvclJlYXNvblILZXJyb3JSZWFzb24SWQobcmVzZXRfcGFzc3dvcmRfcmVxdWVzdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIYcmVzZXRQYXNzd29yZFJlcXVlc3RlZEF0');
@$core.Deprecated('Use refreshAccessTokenRequestDescriptor instead')
const RefreshAccessTokenRequest$json = const {
  '1': 'RefreshAccessTokenRequest',
  '2': const [
    const {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshAccessTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshAccessTokenRequestDescriptor = $convert.base64Decode('ChlSZWZyZXNoQWNjZXNzVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbg==');
@$core.Deprecated('Use refreshAccessTokenResponseDescriptor instead')
const RefreshAccessTokenResponse$json = const {
  '1': 'RefreshAccessTokenResponse',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'error_reason', '3': 2, '4': 1, '5': 11, '6': '.v2.sys_account.services.ErrorReason', '10': 'errorReason'},
  ],
};

/// Descriptor for `RefreshAccessTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshAccessTokenResponseDescriptor = $convert.base64Decode('ChpSZWZyZXNoQWNjZXNzVG9rZW5SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEkcKDGVycm9yX3JlYXNvbhgCIAEoCzIkLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLkVycm9yUmVhc29uUgtlcnJvclJlYXNvbg==');
@$core.Deprecated('Use userDefinedFieldsDescriptor instead')
const UserDefinedFields$json = const {
  '1': 'UserDefinedFields',
  '2': const [
    const {'1': 'fields', '3': 1, '4': 1, '5': 12, '10': 'fields'},
  ],
};

/// Descriptor for `UserDefinedFields`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDefinedFieldsDescriptor = $convert.base64Decode('ChFVc2VyRGVmaW5lZEZpZWxkcxIWCgZmaWVsZHMYASABKAxSBmZpZWxkcw==');
@$core.Deprecated('Use verifyAccountRequestDescriptor instead')
const VerifyAccountRequest$json = const {
  '1': 'VerifyAccountRequest',
  '2': const [
    const {'1': 'verify_token', '3': 1, '4': 1, '5': 9, '10': 'verifyToken'},
    const {'1': 'account_id', '3': 2, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `VerifyAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyAccountRequestDescriptor = $convert.base64Decode('ChRWZXJpZnlBY2NvdW50UmVxdWVzdBIhCgx2ZXJpZnlfdG9rZW4YASABKAlSC3ZlcmlmeVRva2VuEh0KCmFjY291bnRfaWQYAiABKAlSCWFjY291bnRJZA==');
@$core.Deprecated('Use projectDescriptor instead')
const Project$json = const {
  '1': 'Project',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'logo_resource_id', '3': 3, '4': 1, '5': 9, '10': 'logoResourceId'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'creator_id', '3': 5, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'org_id', '3': 6, '4': 1, '5': 9, '10': 'orgId'},
    const {'1': 'org', '3': 7, '4': 1, '5': 11, '6': '.v2.sys_account.services.Org', '10': 'org'},
    const {'1': 'logo', '3': 8, '4': 1, '5': 12, '10': 'logo'},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode('CgdQcm9qZWN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEigKEGxvZ29fcmVzb3VyY2VfaWQYAyABKAlSDmxvZ29SZXNvdXJjZUlkEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSHQoKY3JlYXRvcl9pZBgFIAEoCVIJY3JlYXRvcklkEhUKBm9yZ19pZBgGIAEoCVIFb3JnSWQSLgoDb3JnGAcgASgLMhwudjIuc3lzX2FjY291bnQuc2VydmljZXMuT3JnUgNvcmcSEgoEbG9nbxgIIAEoDFIEbG9nbw==');
@$core.Deprecated('Use projectRequestDescriptor instead')
const ProjectRequest$json = const {
  '1': 'ProjectRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'logo_filepath', '3': 2, '4': 1, '5': 9, '10': 'logoFilepath'},
    const {'1': 'creator_id', '3': 3, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'org_id', '3': 4, '4': 1, '5': 9, '10': 'orgId'},
    const {'1': 'org_name', '3': 5, '4': 1, '5': 9, '10': 'orgName'},
    const {'1': 'logo_upload_bytes', '3': 6, '4': 1, '5': 9, '10': 'logoUploadBytes'},
  ],
};

/// Descriptor for `ProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectRequestDescriptor = $convert.base64Decode('Cg5Qcm9qZWN0UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiMKDWxvZ29fZmlsZXBhdGgYAiABKAlSDGxvZ29GaWxlcGF0aBIdCgpjcmVhdG9yX2lkGAMgASgJUgljcmVhdG9ySWQSFQoGb3JnX2lkGAQgASgJUgVvcmdJZBIZCghvcmdfbmFtZRgFIAEoCVIHb3JnTmFtZRIqChFsb2dvX3VwbG9hZF9ieXRlcxgGIAEoCVIPbG9nb1VwbG9hZEJ5dGVz');
@$core.Deprecated('Use projectUpdateRequestDescriptor instead')
const ProjectUpdateRequest$json = const {
  '1': 'ProjectUpdateRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'logo_filepath', '3': 3, '4': 1, '5': 9, '10': 'logoFilepath'},
    const {'1': 'logo_upload_bytes', '3': 4, '4': 1, '5': 12, '10': 'logoUploadBytes'},
  ],
};

/// Descriptor for `ProjectUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectUpdateRequestDescriptor = $convert.base64Decode('ChRQcm9qZWN0VXBkYXRlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIjCg1sb2dvX2ZpbGVwYXRoGAMgASgJUgxsb2dvRmlsZXBhdGgSKgoRbG9nb191cGxvYWRfYnl0ZXMYBCABKAxSD2xvZ29VcGxvYWRCeXRlcw==');
@$core.Deprecated('Use orgDescriptor instead')
const Org$json = const {
  '1': 'Org',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'logo_resource_id', '3': 3, '4': 1, '5': 9, '10': 'logoResourceId'},
    const {'1': 'contact', '3': 4, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'creator_id', '3': 6, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'projects', '3': 7, '4': 3, '5': 11, '6': '.v2.sys_account.services.Project', '10': 'projects'},
    const {'1': 'logo', '3': 8, '4': 1, '5': 12, '10': 'logo'},
  ],
};

/// Descriptor for `Org`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orgDescriptor = $convert.base64Decode('CgNPcmcSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKAoQbG9nb19yZXNvdXJjZV9pZBgDIAEoCVIObG9nb1Jlc291cmNlSWQSGAoHY29udGFjdBgEIAEoCVIHY29udGFjdBI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Eh0KCmNyZWF0b3JfaWQYBiABKAlSCWNyZWF0b3JJZBI8Cghwcm9qZWN0cxgHIAMoCzIgLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLlByb2plY3RSCHByb2plY3RzEhIKBGxvZ28YCCABKAxSBGxvZ28=');
@$core.Deprecated('Use orgRequestDescriptor instead')
const OrgRequest$json = const {
  '1': 'OrgRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'logo_filepath', '3': 2, '4': 1, '5': 9, '10': 'logoFilepath'},
    const {'1': 'contact', '3': 3, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'creator_id', '3': 4, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'logo_upload_bytes', '3': 5, '4': 1, '5': 9, '10': 'logoUploadBytes'},
  ],
};

/// Descriptor for `OrgRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orgRequestDescriptor = $convert.base64Decode('CgpPcmdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSIwoNbG9nb19maWxlcGF0aBgCIAEoCVIMbG9nb0ZpbGVwYXRoEhgKB2NvbnRhY3QYAyABKAlSB2NvbnRhY3QSHQoKY3JlYXRvcl9pZBgEIAEoCVIJY3JlYXRvcklkEioKEWxvZ29fdXBsb2FkX2J5dGVzGAUgASgJUg9sb2dvVXBsb2FkQnl0ZXM=');
@$core.Deprecated('Use orgUpdateRequestDescriptor instead')
const OrgUpdateRequest$json = const {
  '1': 'OrgUpdateRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'contact', '3': 3, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'logo_filepath', '3': 4, '4': 1, '5': 9, '10': 'logoFilepath'},
    const {'1': 'logo_upload_bytes', '3': 5, '4': 1, '5': 12, '10': 'logoUploadBytes'},
  ],
};

/// Descriptor for `OrgUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orgUpdateRequestDescriptor = $convert.base64Decode('ChBPcmdVcGRhdGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhgKB2NvbnRhY3QYAyABKAlSB2NvbnRhY3QSIwoNbG9nb19maWxlcGF0aBgEIAEoCVIMbG9nb0ZpbGVwYXRoEioKEWxvZ29fdXBsb2FkX2J5dGVzGAUgASgMUg9sb2dvVXBsb2FkQnl0ZXM=');
@$core.Deprecated('Use idRequestDescriptor instead')
const IdRequest$json = const {
  '1': 'IdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `IdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idRequestDescriptor = $convert.base64Decode('CglJZFJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWU=');
@$core.Deprecated('Use listRequestDescriptor instead')
const ListRequest$json = const {
  '1': 'ListRequest',
  '2': const [
    const {'1': 'per_page_entries', '3': 1, '4': 1, '5': 3, '10': 'perPageEntries'},
    const {'1': 'order_by', '3': 2, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'current_page_id', '3': 3, '4': 1, '5': 9, '10': 'currentPageId'},
    const {'1': 'is_descending', '3': 4, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'filters', '3': 5, '4': 1, '5': 12, '10': 'filters'},
    const {'1': 'account_id', '3': 6, '4': 1, '5': 9, '10': 'accountId'},
    const {'1': 'matcher', '3': 7, '4': 1, '5': 9, '10': 'matcher'},
  ],
};

/// Descriptor for `ListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRequestDescriptor = $convert.base64Decode('CgtMaXN0UmVxdWVzdBIoChBwZXJfcGFnZV9lbnRyaWVzGAEgASgDUg5wZXJQYWdlRW50cmllcxIZCghvcmRlcl9ieRgCIAEoCVIHb3JkZXJCeRImCg9jdXJyZW50X3BhZ2VfaWQYAyABKAlSDWN1cnJlbnRQYWdlSWQSIwoNaXNfZGVzY2VuZGluZxgEIAEoCFIMaXNEZXNjZW5kaW5nEhgKB2ZpbHRlcnMYBSABKAxSB2ZpbHRlcnMSHQoKYWNjb3VudF9pZBgGIAEoCVIJYWNjb3VudElkEhgKB21hdGNoZXIYByABKAlSB21hdGNoZXI=');
@$core.Deprecated('Use listResponseDescriptor instead')
const ListResponse$json = const {
  '1': 'ListResponse',
  '2': const [
    const {'1': 'projects', '3': 1, '4': 3, '5': 11, '6': '.v2.sys_account.services.Project', '10': 'projects'},
    const {'1': 'orgs', '3': 2, '4': 3, '5': 11, '6': '.v2.sys_account.services.Org', '10': 'orgs'},
    const {'1': 'next_page_id', '3': 3, '4': 1, '5': 9, '10': 'nextPageId'},
  ],
};

/// Descriptor for `ListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listResponseDescriptor = $convert.base64Decode('CgxMaXN0UmVzcG9uc2USPAoIcHJvamVjdHMYASADKAsyIC52Mi5zeXNfYWNjb3VudC5zZXJ2aWNlcy5Qcm9qZWN0Ughwcm9qZWN0cxIwCgRvcmdzGAIgAygLMhwudjIuc3lzX2FjY291bnQuc2VydmljZXMuT3JnUgRvcmdzEiAKDG5leHRfcGFnZV9pZBgDIAEoCVIKbmV4dFBhZ2VJZA==');
@$core.Deprecated('Use newUserRolesDescriptor instead')
const NewUserRoles$json = const {
  '1': 'NewUserRoles',
  '2': const [
    const {'1': 'role', '3': 1, '4': 1, '5': 14, '6': '.v2.sys_account.services.Roles', '10': 'role'},
    const {'1': 'project_id', '3': 2, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'org_id', '3': 3, '4': 1, '5': 9, '10': 'orgId'},
    const {'1': 'project_name', '3': 4, '4': 1, '5': 9, '10': 'projectName'},
  ],
};

/// Descriptor for `NewUserRoles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserRolesDescriptor = $convert.base64Decode('CgxOZXdVc2VyUm9sZXMSMgoEcm9sZRgBIAEoDjIeLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLlJvbGVzUgRyb2xlEh0KCnByb2plY3RfaWQYAiABKAlSCXByb2plY3RJZBIVCgZvcmdfaWQYAyABKAlSBW9yZ0lkEiEKDHByb2plY3RfbmFtZRgEIAEoCVILcHJvamVjdE5hbWU=');
@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = const {
  '1': 'Permission',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 1, '5': 9, '10': 'resource'},
    const {'1': 'resource_kind', '3': 2, '4': 1, '5': 9, '10': 'resourceKind'},
    const {'1': 'activities', '3': 3, '4': 3, '5': 9, '10': 'activities'},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode('CgpQZXJtaXNzaW9uEhoKCHJlc291cmNlGAEgASgJUghyZXNvdXJjZRIjCg1yZXNvdXJjZV9raW5kGAIgASgJUgxyZXNvdXJjZUtpbmQSHgoKYWN0aXZpdGllcxgDIAMoCVIKYWN0aXZpdGllcw==');
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'roles', '3': 4, '4': 3, '5': 11, '6': '.v2.sys_account.services.UserRoles', '10': 'roles'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'last_login', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastLogin'},
    const {'1': 'disabled', '3': 8, '4': 1, '5': 8, '10': 'disabled'},
    const {'1': 'verified', '3': 9, '4': 1, '5': 8, '10': 'verified'},
    const {'1': 'avatar_resource_id', '3': 10, '4': 1, '5': 9, '10': 'avatarResourceId'},
    const {'1': 'avatar', '3': 11, '4': 1, '5': 12, '10': 'avatar'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50Eg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3JkEjgKBXJvbGVzGAQgAygLMiIudjIuc3lzX2FjY291bnQuc2VydmljZXMuVXNlclJvbGVzUgVyb2xlcxI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSOQoKbGFzdF9sb2dpbhgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWxhc3RMb2dpbhIaCghkaXNhYmxlZBgIIAEoCFIIZGlzYWJsZWQSGgoIdmVyaWZpZWQYCSABKAhSCHZlcmlmaWVkEiwKEmF2YXRhcl9yZXNvdXJjZV9pZBgKIAEoCVIQYXZhdGFyUmVzb3VyY2VJZBIWCgZhdmF0YXIYCyABKAxSBmF2YXRhcg==');
@$core.Deprecated('Use accountNewRequestDescriptor instead')
const AccountNewRequest$json = const {
  '1': 'AccountNewRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'roles', '3': 3, '4': 3, '5': 11, '6': '.v2.sys_account.services.UserRoles', '10': 'roles'},
    const {'1': 'avatar_filepath', '3': 4, '4': 1, '5': 9, '10': 'avatarFilepath'},
    const {'1': 'avatar_upload_bytes', '3': 5, '4': 1, '5': 9, '10': 'avatarUploadBytes'},
    const {'1': 'new_user_roles', '3': 6, '4': 3, '5': 11, '6': '.v2.sys_account.services.NewUserRoles', '10': 'newUserRoles'},
  ],
};

/// Descriptor for `AccountNewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountNewRequestDescriptor = $convert.base64Decode('ChFBY2NvdW50TmV3UmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEjgKBXJvbGVzGAMgAygLMiIudjIuc3lzX2FjY291bnQuc2VydmljZXMuVXNlclJvbGVzUgVyb2xlcxInCg9hdmF0YXJfZmlsZXBhdGgYBCABKAlSDmF2YXRhckZpbGVwYXRoEi4KE2F2YXRhcl91cGxvYWRfYnl0ZXMYBSABKAlSEWF2YXRhclVwbG9hZEJ5dGVzEksKDm5ld191c2VyX3JvbGVzGAYgAygLMiUudjIuc3lzX2FjY291bnQuc2VydmljZXMuTmV3VXNlclJvbGVzUgxuZXdVc2VyUm9sZXM=');
@$core.Deprecated('Use accountUpdateRequestDescriptor instead')
const AccountUpdateRequest$json = const {
  '1': 'AccountUpdateRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'disabled', '3': 4, '4': 1, '5': 8, '10': 'disabled'},
    const {'1': 'verified', '3': 5, '4': 1, '5': 8, '10': 'verified'},
    const {'1': 'avatar_filepath', '3': 6, '4': 1, '5': 9, '10': 'avatarFilepath'},
    const {'1': 'avatar_upload_bytes', '3': 7, '4': 1, '5': 12, '10': 'avatarUploadBytes'},
  ],
};

/// Descriptor for `AccountUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountUpdateRequestDescriptor = $convert.base64Decode('ChRBY2NvdW50VXBkYXRlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFAoFZW1haWwYAiABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBIaCghkaXNhYmxlZBgEIAEoCFIIZGlzYWJsZWQSGgoIdmVyaWZpZWQYBSABKAhSCHZlcmlmaWVkEicKD2F2YXRhcl9maWxlcGF0aBgGIAEoCVIOYXZhdGFyRmlsZXBhdGgSLgoTYXZhdGFyX3VwbG9hZF9ieXRlcxgHIAEoDFIRYXZhdGFyVXBsb2FkQnl0ZXM=');
@$core.Deprecated('Use getAccountRequestDescriptor instead')
const GetAccountRequest$json = const {
  '1': 'GetAccountRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountRequestDescriptor = $convert.base64Decode('ChFHZXRBY2NvdW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use listAccountsRequestDescriptor instead')
const ListAccountsRequest$json = const {
  '1': 'ListAccountsRequest',
  '2': const [
    const {'1': 'per_page_entries', '3': 1, '4': 1, '5': 3, '10': 'perPageEntries'},
    const {'1': 'order_by', '3': 2, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'current_page_id', '3': 3, '4': 1, '5': 9, '10': 'currentPageId'},
    const {'1': 'is_descending', '3': 4, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'filters', '3': 5, '4': 1, '5': 12, '10': 'filters'},
    const {'1': 'matcher', '3': 6, '4': 1, '5': 9, '10': 'matcher'},
  ],
};

/// Descriptor for `ListAccountsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountsRequestDescriptor = $convert.base64Decode('ChNMaXN0QWNjb3VudHNSZXF1ZXN0EigKEHBlcl9wYWdlX2VudHJpZXMYASABKANSDnBlclBhZ2VFbnRyaWVzEhkKCG9yZGVyX2J5GAIgASgJUgdvcmRlckJ5EiYKD2N1cnJlbnRfcGFnZV9pZBgDIAEoCVINY3VycmVudFBhZ2VJZBIjCg1pc19kZXNjZW5kaW5nGAQgASgIUgxpc0Rlc2NlbmRpbmcSGAoHZmlsdGVycxgFIAEoDFIHZmlsdGVycxIYCgdtYXRjaGVyGAYgASgJUgdtYXRjaGVy');
@$core.Deprecated('Use listAccountsResponseDescriptor instead')
const ListAccountsResponse$json = const {
  '1': 'ListAccountsResponse',
  '2': const [
    const {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.v2.sys_account.services.Account', '10': 'accounts'},
    const {'1': 'next_page_id', '3': 2, '4': 1, '5': 9, '10': 'nextPageId'},
  ],
};

/// Descriptor for `ListAccountsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAccountsResponseDescriptor = $convert.base64Decode('ChRMaXN0QWNjb3VudHNSZXNwb25zZRI8CghhY2NvdW50cxgBIAMoCzIgLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLkFjY291bnRSCGFjY291bnRzEiAKDG5leHRfcGFnZV9pZBgCIAEoCVIKbmV4dFBhZ2VJZA==');
@$core.Deprecated('Use searchAccountsRequestDescriptor instead')
const SearchAccountsRequest$json = const {
  '1': 'SearchAccountsRequest',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 12, '10': 'query'},
    const {'1': 'search_params', '3': 2, '4': 1, '5': 11, '6': '.v2.sys_account.services.ListAccountsRequest', '10': 'searchParams'},
  ],
};

/// Descriptor for `SearchAccountsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchAccountsRequestDescriptor = $convert.base64Decode('ChVTZWFyY2hBY2NvdW50c1JlcXVlc3QSFAoFcXVlcnkYASABKAxSBXF1ZXJ5ElEKDXNlYXJjaF9wYXJhbXMYAiABKAsyLC52Mi5zeXNfYWNjb3VudC5zZXJ2aWNlcy5MaXN0QWNjb3VudHNSZXF1ZXN0UgxzZWFyY2hQYXJhbXM=');
@$core.Deprecated('Use searchAccountsResponseDescriptor instead')
const SearchAccountsResponse$json = const {
  '1': 'SearchAccountsResponse',
  '2': const [
    const {'1': 'search_response', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.ListAccountsResponse', '10': 'searchResponse'},
  ],
};

/// Descriptor for `SearchAccountsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchAccountsResponseDescriptor = $convert.base64Decode('ChZTZWFyY2hBY2NvdW50c1Jlc3BvbnNlElYKD3NlYXJjaF9yZXNwb25zZRgBIAEoCzItLnYyLnN5c19hY2NvdW50LnNlcnZpY2VzLkxpc3RBY2NvdW50c1Jlc3BvbnNlUg5zZWFyY2hSZXNwb25zZQ==');
@$core.Deprecated('Use assignAccountToRoleRequestDescriptor instead')
const AssignAccountToRoleRequest$json = const {
  '1': 'AssignAccountToRoleRequest',
  '2': const [
    const {'1': 'assignee_account_id', '3': 1, '4': 1, '5': 9, '10': 'assigneeAccountId'},
    const {'1': 'assigned_account_id', '3': 2, '4': 1, '5': 9, '10': 'assignedAccountId'},
    const {'1': 'role', '3': 3, '4': 1, '5': 11, '6': '.v2.sys_account.services.UserRoles', '10': 'role'},
  ],
};

/// Descriptor for `AssignAccountToRoleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignAccountToRoleRequestDescriptor = $convert.base64Decode('ChpBc3NpZ25BY2NvdW50VG9Sb2xlUmVxdWVzdBIuChNhc3NpZ25lZV9hY2NvdW50X2lkGAEgASgJUhFhc3NpZ25lZUFjY291bnRJZBIuChNhc3NpZ25lZF9hY2NvdW50X2lkGAIgASgJUhFhc3NpZ25lZEFjY291bnRJZBI2CgRyb2xlGAMgASgLMiIudjIuc3lzX2FjY291bnQuc2VydmljZXMuVXNlclJvbGVzUgRyb2xl');
@$core.Deprecated('Use disableAccountRequestDescriptor instead')
const DisableAccountRequest$json = const {
  '1': 'DisableAccountRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `DisableAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableAccountRequestDescriptor = $convert.base64Decode('ChVEaXNhYmxlQWNjb3VudFJlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoCVIJYWNjb3VudElk');
