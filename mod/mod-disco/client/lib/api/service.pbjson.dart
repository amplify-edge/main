///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ListSupportRoleRequest$json = const {
  '1': 'ListSupportRoleRequest',
};

const GetSupportRoleRequest$json = const {
  '1': 'GetSupportRoleRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Campaigns$json = const {
  '1': 'Campaigns',
  '2': const [
    const {'1': 'campaigns', '3': 1, '4': 3, '5': 11, '6': '.proto.Campaign', '10': 'campaigns'},
  ],
};

const ListCampaignRequest$json = const {
  '1': 'ListCampaignRequest',
};

const GetCampaignRequest$json = const {
  '1': 'GetCampaignRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const NewAnswerRequest$json = const {
  '1': 'NewAnswerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sel_support_role_id', '3': 2, '4': 1, '5': 9, '10': 'selSupportRoleId'},
    const {'1': 'sel_campaign_id', '3': 3, '4': 1, '5': 9, '10': 'selCampaignId'},
    const {'1': 'min_hours_pledged', '3': 4, '4': 1, '5': 9, '10': 'minHoursPledged'},
  ],
};

const Answer$json = const {
  '1': 'Answer',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sel_support_role_id', '3': 2, '4': 1, '5': 9, '10': 'selSupportRoleId'},
    const {'1': 'sel_campaign_id', '3': 3, '4': 1, '5': 9, '10': 'selCampaignId'},
    const {'1': 'min_hours_pledged', '3': 4, '4': 1, '5': 9, '10': 'minHoursPledged'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

const Answers$json = const {
  '1': 'Answers',
  '2': const [
    const {'1': 'answers', '3': 1, '4': 3, '5': 11, '6': '.proto.Answer', '10': 'answers'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'display_name', '3': 5, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'avatar', '3': 6, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'url', '3': 7, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'chatgroup_ids', '3': 8, '4': 1, '5': 9, '10': 'chatgroupIds'},
    const {'1': 'campaign', '3': 9, '4': 1, '5': 9, '10': 'campaign'},
  ],
};

const SupportRole$json = const {
  '1': 'SupportRole',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'mandatory', '3': 4, '4': 1, '5': 8, '10': 'mandatory'},
    const {'1': 'uom', '3': 5, '4': 1, '5': 9, '10': 'uom'},
  ],
};

const Campaign$json = const {
  '1': 'Campaign',
  '2': const [
    const {'1': 'campaign_id', '3': 1, '4': 1, '5': 9, '10': 'campaignId'},
    const {'1': 'campaign_name', '3': 2, '4': 1, '5': 9, '10': 'campaignName'},
    const {'1': 'logo_url', '3': 3, '4': 1, '5': 9, '10': 'logoUrl'},
    const {'1': 'goal', '3': 4, '4': 1, '5': 9, '10': 'goal'},
    const {'1': 'crg_quantity_many', '3': 5, '4': 3, '5': 9, '10': 'crgQuantityMany'},
    const {'1': 'crg_ids_many', '3': 6, '4': 3, '5': 9, '10': 'crgIdsMany'},
    const {'1': 'already_pledged', '3': 7, '4': 1, '5': 9, '10': 'alreadyPledged'},
    const {'1': 'action_time', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'actionTime'},
    const {'1': 'action_location', '3': 9, '4': 1, '5': 9, '10': 'actionLocation'},
    const {'1': 'campaign_still', '3': 10, '4': 1, '5': 9, '10': 'campaignStill'},
    const {'1': 'min_pioneers', '3': 11, '4': 1, '5': 9, '10': 'minPioneers'},
    const {'1': 'min_rebels_for_media', '3': 12, '4': 1, '5': 9, '10': 'minRebelsForMedia'},
    const {'1': 'min_rebels_to_win', '3': 13, '4': 1, '5': 9, '10': 'minRebelsToWin'},
    const {'1': 'action_type', '3': 15, '4': 1, '5': 9, '10': 'actionType'},
    const {'1': 'backing_org', '3': 16, '4': 3, '5': 9, '10': 'backingOrg'},
    const {'1': 'category', '3': 17, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'contact', '3': 18, '4': 1, '5': 9, '10': 'contact'},
    const {'1': 'hist_precedents', '3': 19, '4': 1, '5': 9, '10': 'histPrecedents'},
    const {'1': 'organization', '3': 20, '4': 1, '5': 9, '10': 'organization'},
    const {'1': 'strategy', '3': 21, '4': 1, '5': 9, '10': 'strategy'},
    const {'1': 'video_url', '3': 22, '4': 3, '5': 9, '10': 'videoUrl'},
    const {'1': 'uom', '3': 23, '4': 1, '5': 9, '10': 'uom'},
    const {'1': 'action_length_string', '3': 24, '4': 1, '5': 9, '9': 0, '10': 'actionLengthString'},
    const {'1': 'action_length_int', '3': 25, '4': 1, '5': 13, '9': 0, '10': 'actionLengthInt'},
  ],
  '8': const [
    const {'1': 'action_length'},
  ],
};

const NewAnswerResponse$json = const {
  '1': 'NewAnswerResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

const DeleteAnswerResponse$json = const {
  '1': 'DeleteAnswerResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const AnswerIdRequest$json = const {
  '1': 'AnswerIdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const SupportRoles$json = const {
  '1': 'SupportRoles',
  '2': const [
    const {'1': 'support_roles', '3': 1, '4': 3, '5': 11, '6': '.proto.SupportRole', '10': 'supportRoles'},
  ],
};

const ListAnswersRequest$json = const {
  '1': 'ListAnswersRequest',
  '2': const [
    const {'1': 'support_role_id', '3': 1, '4': 1, '5': 9, '10': 'supportRoleId'},
    const {'1': 'campaign_id', '3': 2, '4': 1, '5': 9, '10': 'campaignId'},
  ],
};

const ListUserRequest$json = const {
  '1': 'ListUserRequest',
};

const GetUserRequest$json = const {
  '1': 'GetUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Users$json = const {
  '1': 'Users',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.proto.User', '10': 'users'},
  ],
};

const MigrateRequest$json = const {
  '1': 'MigrateRequest',
  '2': const [
    const {'1': 'datapath', '3': 1, '4': 1, '5': 9, '10': 'datapath'},
  ],
};

