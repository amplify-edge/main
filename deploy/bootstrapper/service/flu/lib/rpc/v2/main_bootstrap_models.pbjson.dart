///
//  Generated code. Do not modify.
//  source: main_bootstrap_models.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const BSProject$json = const {
  '1': 'BSProject',
  '2': const [
    const {'1': 'project', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.ProjectRequest', '10': 'project'},
    const {'1': 'project_details', '3': 2, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewDiscoProjectRequest', '10': 'projectDetails'},
    const {'1': 'survey_schema', '3': 3, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewSurveyProjectRequest', '10': 'surveySchema'},
  ],
};

const BSOrg$json = const {
  '1': 'BSOrg',
  '2': const [
    const {'1': 'org', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.OrgRequest', '10': 'org'},
  ],
};

const BSRequest$json = const {
  '1': 'BSRequest',
  '2': const [
    const {'1': 'orgs', '3': 1, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSOrg', '10': 'orgs'},
    const {'1': 'projects', '3': 2, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSProject', '10': 'projects'},
    const {'1': 'regular_users', '3': 4, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BSRegularAccount', '10': 'regularUsers'},
  ],
};

const BSAccount$json = const {
  '1': 'BSAccount',
  '2': const [
    const {'1': 'initial_superuser', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.LoginRequest', '10': 'initialSuperuser'},
  ],
};

const BSRegularAccount$json = const {
  '1': 'BSRegularAccount',
  '2': const [
    const {'1': 'new_accounts', '3': 1, '4': 1, '5': 11, '6': '.v2.sys_account.services.AccountNewRequest', '10': 'newAccounts'},
    const {'1': 'survey_value', '3': 2, '4': 1, '5': 11, '6': '.v2.mod_disco.services.NewSurveyUserRequest', '10': 'surveyValue'},
  ],
};

const NewBSRequest$json = const {
  '1': 'NewBSRequest',
  '2': const [
    const {'1': 'file_extension', '3': 1, '4': 1, '5': 9, '10': 'fileExtension'},
    const {'1': 'bs_request', '3': 2, '4': 1, '5': 12, '10': 'bsRequest'},
  ],
};

const NewBSResponse$json = const {
  '1': 'NewBSResponse',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
  ],
};

const GetBSRequest$json = const {
  '1': 'GetBSRequest',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
  ],
};

const BS$json = const {
  '1': 'BS',
  '2': const [
    const {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'content', '3': 3, '4': 1, '5': 11, '6': '.v2.main_bootstrap.services.BSRequest', '10': 'content'},
  ],
};

const ListBSResponse$json = const {
  '1': 'ListBSResponse',
  '2': const [
    const {'1': 'bootstraps', '3': 1, '4': 3, '5': 11, '6': '.v2.main_bootstrap.services.BS', '10': 'bootstraps'},
  ],
};

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

