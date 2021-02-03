///
//  Generated code. Do not modify.
//  source: vendor/github.com/amplify-cms/mod/mod-disco/proto/v2/mod_disco_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {
      '1': 'sys_account_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'sysAccountRefId'
    },
    const {
      '1': 'selected_country',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'selectedCountry'
    },
    const {'1': 'selected_city', '3': 3, '4': 1, '5': 9, '10': 'selectedCity'},
    const {
      '1': 'selected_age_range',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'selectedAgeRange'
    },
    const {
      '1': 'created_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    const {
      '1': 'updated_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

const NewUserInfo$json = const {
  '1': 'NewUserInfo',
  '2': const [
    const {
      '1': 'sys_account_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'sysAccountRefId'
    },
    const {
      '1': 'sys_account_ref_email',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountRefEmail'
    },
    const {
      '1': 'selected_country',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'selectedCountry'
    },
    const {'1': 'selected_city', '3': 4, '4': 1, '5': 9, '10': 'selectedCity'},
    const {
      '1': 'selected_age_range',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'selectedAgeRange'
    },
  ],
};

const UpdateUserInfo$json = const {
  '1': 'UpdateUserInfo',
  '2': const [
    const {
      '1': 'sys_account_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'sysAccountRefId'
    },
    const {
      '1': 'selected_country',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'selectedCountry'
    },
    const {'1': 'selected_city', '3': 3, '4': 1, '5': 9, '10': 'selectedCity'},
    const {
      '1': 'selected_age_range',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'selectedAgeRange'
    },
  ],
};

const UserInfoValues$json = const {
  '1': 'UserInfoValues',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'countries', '3': 2, '4': 3, '5': 9, '10': 'countries'},
    const {'1': 'cities', '3': 3, '4': 3, '5': 9, '10': 'cities'},
    const {
      '1': 'selected_age_ranges',
      '3': 4,
      '4': 3,
      '5': 9,
      '10': 'selectedAgeRanges'
    },
  ],
};

const SupportRoleType$json = const {
  '1': 'SupportRoleType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'unit_of_measures',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
  ],
};

const NewSupportRoleType$json = const {
  '1': 'NewSupportRoleType',
  '2': const [
    const {
      '1': 'survey_project_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {
      '1': 'survey_project_ref_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefName'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'unit_of_measures',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
  ],
};

const SupportRoleValue$json = const {
  '1': 'SupportRoleValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_user_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefId'
    },
    const {
      '1': 'support_role_type_ref_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'supportRoleTypeRefId'
    },
    const {'1': 'pledged', '3': 4, '4': 1, '5': 4, '10': 'pledged'},
    const {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
  ],
};

const NewSupportRoleValue$json = const {
  '1': 'NewSupportRoleValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_user_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefId'
    },
    const {
      '1': 'survey_user_ref_name',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefName'
    },
    const {
      '1': 'support_role_type_ref_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'supportRoleTypeRefId'
    },
    const {
      '1': 'support_role_type_ref_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'supportRoleTypeRefName'
    },
    const {'1': 'pledged', '3': 6, '4': 1, '5': 4, '10': 'pledged'},
    const {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

const UserNeedsType$json = const {
  '1': 'UserNeedsType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'unit_of_measures',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
    const {
      '1': 'question_group',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'questionGroup'
    },
    const {'1': 'question_type', '3': 8, '4': 1, '5': 9, '10': 'questionType'},
    const {
      '1': 'dropdown_question',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'dropdownQuestion'
    },
  ],
};

const NewUserNeedsType$json = const {
  '1': 'NewUserNeedsType',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'unit_of_measures',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
    const {
      '1': 'question_group',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'questionGroup'
    },
    const {'1': 'question_type', '3': 8, '4': 1, '5': 9, '10': 'questionType'},
    const {
      '1': 'dropdown_question',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'dropdownQuestion'
    },
  ],
};

const UserNeedsValue$json = const {
  '1': 'UserNeedsValue',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'survey_user_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefId'
    },
    const {
      '1': 'user_needs_type_ref_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'userNeedsTypeRefId'
    },
    const {'1': 'comments', '3': 4, '4': 1, '5': 9, '10': 'comments'},
  ],
};

const SurveyValuePlusAccount$json = const {
  '1': 'SurveyValuePlusAccount',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'sys_account_user_ref_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountUserRefName'
    },
    const {'1': 'pledged', '3': 3, '4': 1, '5': 4, '10': 'pledged'},
    const {
      '1': 'created_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

const NewUserNeedsValue$json = const {
  '1': 'NewUserNeedsValue',
  '2': const [
    const {
      '1': 'survey_user_ref_name',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefName'
    },
    const {
      '1': 'survey_user_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyUserRefId'
    },
    const {
      '1': 'user_needs_type_ref_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'userNeedsTypeRefId'
    },
    const {
      '1': 'user_needs_type_ref_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'userNeedsTypeRefName'
    },
    const {'1': 'comments', '3': 5, '4': 1, '5': 9, '10': 'comments'},
  ],
};

const SurveyProject$json = const {
  '1': 'SurveyProject',
  '2': const [
    const {
      '1': 'survey_project_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectId'
    },
    const {
      '1': 'sys_account_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefId'
    },
    const {
      '1': 'support_role_types',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SupportRoleType',
      '10': 'supportRoleTypes'
    },
    const {
      '1': 'user_need_types',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.UserNeedsType',
      '10': 'userNeedTypes'
    },
    const {
      '1': 'created_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    const {
      '1': 'updated_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    const {
      '1': 'survey_project_name',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectName'
    },
  ],
};

const SurveyUser$json = const {
  '1': 'SurveyUser',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {
      '1': 'survey_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {
      '1': 'sys_account_account_ref_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'sysAccountAccountRefId'
    },
    const {
      '1': 'support_role_values',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SupportRoleValue',
      '10': 'supportRoleValues'
    },
    const {
      '1': 'user_need_values',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.UserNeedsValue',
      '10': 'userNeedValues'
    },
    const {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    const {
      '1': 'updated_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    const {
      '1': 'survey_project_ref_name',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefName'
    },
    const {
      '1': 'survey_user_name',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'surveyUserName'
    },
  ],
};

const DiscoProject$json = const {
  '1': 'DiscoProject',
  '2': const [
    const {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    const {
      '1': 'sys_account_project_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefId'
    },
    const {
      '1': 'sys_account_org_ref_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'sysAccountOrgRefId'
    },
    const {'1': 'goal', '3': 4, '4': 1, '5': 9, '10': 'goal'},
    const {
      '1': 'already_pledged',
      '3': 5,
      '4': 1,
      '5': 4,
      '10': 'alreadyPledged'
    },
    const {
      '1': 'action_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'actionTime'
    },
    const {
      '1': 'action_location',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'actionLocation'
    },
    const {'1': 'min_pioneers', '3': 8, '4': 1, '5': 4, '10': 'minPioneers'},
    const {
      '1': 'min_rebels_media',
      '3': 9,
      '4': 1,
      '5': 4,
      '10': 'minRebelsMedia'
    },
    const {
      '1': 'min_rebels_to_win',
      '3': 10,
      '4': 1,
      '5': 4,
      '10': 'minRebelsToWin'
    },
    const {'1': 'action_length', '3': 11, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 12, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 14, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 15, '4': 1, '5': 9, '10': 'contact'},
    const {
      '1': 'hist_precedents',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'histPrecedents'
    },
    const {'1': 'strategy', '3': 17, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 18, '4': 3, '5': 9, '10': 'videoUrl'},
    const {
      '1': 'unit_of_measures',
      '3': 19,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
    const {
      '1': 'created_at',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    const {
      '1': 'updated_at',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    const {
      '1': 'image_resource_ids',
      '3': 22,
      '4': 3,
      '5': 9,
      '10': 'imageResourceIds'
    },
    const {
      '1': 'project_images',
      '3': 23,
      '4': 3,
      '5': 12,
      '10': 'projectImages'
    },
  ],
};

const NewDiscoProjectRequest$json = const {
  '1': 'NewDiscoProjectRequest',
  '2': const [
    const {
      '1': 'sys_account_project_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefId'
    },
    const {
      '1': 'sys_account_org_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountOrgRefId'
    },
    const {'1': 'goal', '3': 3, '4': 1, '5': 9, '10': 'goal'},
    const {
      '1': 'already_pledged',
      '3': 4,
      '4': 1,
      '5': 4,
      '10': 'alreadyPledged'
    },
    const {
      '1': 'action_time_nano',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'actionTimeNano'
    },
    const {
      '1': 'action_location',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'actionLocation'
    },
    const {'1': 'min_pioneers', '3': 7, '4': 1, '5': 4, '10': 'minPioneers'},
    const {
      '1': 'min_rebels_media',
      '3': 8,
      '4': 1,
      '5': 4,
      '10': 'minRebelsMedia'
    },
    const {
      '1': 'min_rebels_to_win',
      '3': 9,
      '4': 1,
      '5': 4,
      '10': 'minRebelsToWin'
    },
    const {'1': 'action_length', '3': 10, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 11, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 12, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 13, '4': 1, '5': 9, '10': 'contact'},
    const {
      '1': 'hist_precedents',
      '3': 14,
      '4': 1,
      '5': 9,
      '10': 'histPrecedents'
    },
    const {'1': 'strategy', '3': 15, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 16, '4': 3, '5': 9, '10': 'videoUrl'},
    const {
      '1': 'unit_of_measures',
      '3': 17,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
    const {
      '1': 'sys_account_project_ref_name',
      '3': 18,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefName'
    },
    const {
      '1': 'sys_account_org_ref_name',
      '3': 19,
      '4': 1,
      '5': 9,
      '10': 'sysAccountOrgRefName'
    },
    const {
      '1': 'image_filepath',
      '3': 20,
      '4': 3,
      '5': 9,
      '10': 'imageFilepath'
    },
    const {
      '1': 'image_upload_arrays',
      '3': 21,
      '4': 3,
      '5': 9,
      '10': 'imageUploadArrays'
    },
  ],
};

const UpdateDiscoProjectRequest$json = const {
  '1': 'UpdateDiscoProjectRequest',
  '2': const [
    const {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'goal', '3': 2, '4': 1, '5': 9, '10': 'goal'},
    const {
      '1': 'already_pledged',
      '3': 3,
      '4': 1,
      '5': 4,
      '10': 'alreadyPledged'
    },
    const {
      '1': 'action_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'actionTime'
    },
    const {
      '1': 'action_location',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'actionLocation'
    },
    const {'1': 'min_pioneers', '3': 6, '4': 1, '5': 4, '10': 'minPioneers'},
    const {
      '1': 'min_rebels_media',
      '3': 7,
      '4': 1,
      '5': 4,
      '10': 'minRebelsMedia'
    },
    const {
      '1': 'min_rebels_to_win',
      '3': 8,
      '4': 1,
      '5': 4,
      '10': 'minRebelsToWin'
    },
    const {'1': 'action_length', '3': 9, '4': 1, '5': 9, '10': 'actionLength'},
    const {'1': 'action_type', '3': 10, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'category', '3': 11, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 12, '4': 1, '5': 9, '10': 'contact'},
    const {
      '1': 'hist_precedents',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'histPrecedents'
    },
    const {'1': 'strategy', '3': 14, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 15, '4': 1, '5': 9, '10': 'videoUrl'},
    const {
      '1': 'unit_of_measures',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'unitOfMeasures'
    },
    const {
      '1': 'image_uploads',
      '3': 17,
      '4': 3,
      '5': 12,
      '10': 'imageUploads'
    },
    const {
      '1': 'image_resource_ids',
      '3': 18,
      '4': 3,
      '5': 9,
      '10': 'imageResourceIds'
    },
  ],
};

const IdRequest$json = const {
  '1': 'IdRequest',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {
      '1': 'sys_account_project_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectId'
    },
    const {
      '1': 'survey_project_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectId'
    },
    const {
      '1': 'sys_account_account_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sysAccountAccountId'
    },
    const {
      '1': 'disco_project_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'discoProjectId'
    },
    const {
      '1': 'sys_account_org_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'sysAccountOrgId'
    },
  ],
};

const ListRequest$json = const {
  '1': 'ListRequest',
  '2': const [
    const {
      '1': 'id_request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.v2.mod_disco.services.IdRequest',
      '10': 'idRequest'
    },
    const {
      '1': 'per_page_entries',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'perPageEntries'
    },
    const {'1': 'order_by', '3': 3, '4': 1, '5': 9, '10': 'orderBy'},
    const {
      '1': 'current_page_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'currentPageId'
    },
    const {'1': 'filters', '3': 5, '4': 1, '5': 12, '10': 'filters'},
    const {'1': 'isDescending', '3': 6, '4': 1, '5': 8, '10': 'isDescending'},
    const {'1': 'matcher', '3': 7, '4': 1, '5': 9, '10': 'matcher'},
  ],
};

const ListResponse$json = const {
  '1': 'ListResponse',
  '2': const [
    const {
      '1': 'survey_projects',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SurveyProject',
      '10': 'surveyProjects'
    },
    const {
      '1': 'survey_users',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SurveyUser',
      '10': 'surveyUsers'
    },
    const {'1': 'next_page_id', '3': 3, '4': 1, '5': 3, '10': 'nextPageId'},
    const {
      '1': 'disco_projects',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.DiscoProject',
      '10': 'discoProjects'
    },
  ],
};

const NewSurveyProjectRequest$json = const {
  '1': 'NewSurveyProjectRequest',
  '2': const [
    const {
      '1': 'sys_account_project_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefId'
    },
    const {
      '1': 'support_role_types',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.NewSupportRoleType',
      '10': 'supportRoleTypes'
    },
    const {
      '1': 'user_need_types',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.NewUserNeedsType',
      '10': 'userNeedTypes'
    },
    const {
      '1': 'sys_account_project_ref_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sysAccountProjectRefName'
    },
    const {
      '1': 'survey_project_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectName'
    },
  ],
};

const NewSurveyUserRequest$json = const {
  '1': 'NewSurveyUserRequest',
  '2': const [
    const {
      '1': 'survey_project_ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefId'
    },
    const {
      '1': 'sys_account_user_ref_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'sysAccountUserRefId'
    },
    const {
      '1': 'support_role_values',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.NewSupportRoleValue',
      '10': 'supportRoleValues'
    },
    const {
      '1': 'user_need_values',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.NewUserNeedsValue',
      '10': 'userNeedValues'
    },
    const {
      '1': 'survey_project_ref_name',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectRefName'
    },
    const {
      '1': 'sys_account_user_ref_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'sysAccountUserRefName'
    },
    const {
      '1': 'survey_user_name',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'surveyUserName'
    },
  ],
};

const UpdateSurveyProjectRequest$json = const {
  '1': 'UpdateSurveyProjectRequest',
  '2': const [
    const {
      '1': 'survey_project_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'surveyProjectId'
    },
    const {
      '1': 'support_role_types',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SupportRoleType',
      '10': 'supportRoleTypes'
    },
    const {
      '1': 'user_need_types',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.UserNeedsType',
      '10': 'userNeedTypes'
    },
  ],
};

const UpdateSurveyUserRequest$json = const {
  '1': 'UpdateSurveyUserRequest',
  '2': const [
    const {'1': 'survey_user_id', '3': 1, '4': 1, '5': 9, '10': 'surveyUserId'},
    const {
      '1': 'support_role_values',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SupportRoleValue',
      '10': 'supportRoleValues'
    },
    const {
      '1': 'user_need_values',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.UserNeedsValue',
      '10': 'userNeedValues'
    },
  ],
};

const GenIdResponse$json = const {
  '1': 'GenIdResponse',
  '2': const [
    const {'1': 'temp_id', '3': 1, '4': 1, '5': 9, '10': 'tempId'},
  ],
};

const StatisticRequest$json = const {
  '1': 'StatisticRequest',
  '2': const [
    const {'1': 'table_name', '3': 1, '4': 1, '5': 9, '10': 'tableName'},
    const {
      '1': 'include_counts',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'includeCounts'
    },
    const {'1': 'filters', '3': 3, '4': 1, '5': 12, '10': 'filters'},
    const {
      '1': 'current_page_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'currentPageId'
    },
    const {'1': 'limit', '3': 5, '4': 1, '5': 3, '10': 'limit'},
    const {'1': 'order_by', '3': 6, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'is_descending', '3': 7, '4': 1, '5': 8, '10': 'isDescending'},
    const {
      '1': 'per_page_entries',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'perPageEntries'
    },
  ],
};

const StatisticResponse$json = const {
  '1': 'StatisticResponse',
  '2': const [
    const {
      '1': 'survey_value_plus_account',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.v2.mod_disco.services.SurveyValuePlusAccount',
      '10': 'surveyValuePlusAccount'
    },
    const {'1': 'next_page_id', '3': 2, '4': 1, '5': 9, '10': 'nextPageId'},
    const {'1': 'total_count', '3': 3, '4': 1, '5': 3, '10': 'totalCount'},
  ],
};
