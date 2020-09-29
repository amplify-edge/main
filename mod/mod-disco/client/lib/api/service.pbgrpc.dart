///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'service.pb.dart';

class QuestionClient extends $grpc.Client {
  static final _$migrate = $grpc.ClientMethod<$0.MigrateRequest, $1.Empty>(
      '/proto.Question/Migrate',
      ($0.MigrateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.User>(
      '/proto.Question/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$0.ListUserRequest, $0.Users>(
      '/proto.Question/ListUsers',
      ($0.ListUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Users.fromBuffer(value));
  static final _$getCampaign =
      $grpc.ClientMethod<$0.GetCampaignRequest, $0.Campaign>(
          '/proto.Question/GetCampaign',
          ($0.GetCampaignRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Campaign.fromBuffer(value));
  static final _$listCampaigns =
      $grpc.ClientMethod<$0.ListCampaignRequest, $0.Campaigns>(
          '/proto.Question/ListCampaigns',
          ($0.ListCampaignRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Campaigns.fromBuffer(value));
  static final _$getSupportRole =
      $grpc.ClientMethod<$0.GetSupportRoleRequest, $0.SupportRole>(
          '/proto.Question/GetSupportRole',
          ($0.GetSupportRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SupportRole.fromBuffer(value));
  static final _$listSupportRoles =
      $grpc.ClientMethod<$0.ListSupportRoleRequest, $0.SupportRoles>(
          '/proto.Question/ListSupportRoles',
          ($0.ListSupportRoleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SupportRoles.fromBuffer(value));
  static final _$newAnswer =
      $grpc.ClientMethod<$0.NewAnswerRequest, $0.NewAnswerResponse>(
          '/proto.Question/NewAnswer',
          ($0.NewAnswerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NewAnswerResponse.fromBuffer(value));
  static final _$getAnswer = $grpc.ClientMethod<$0.AnswerIdRequest, $0.Answer>(
      '/proto.Question/GetAnswer',
      ($0.AnswerIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Answer.fromBuffer(value));
  static final _$deleteAnswer =
      $grpc.ClientMethod<$0.AnswerIdRequest, $0.DeleteAnswerResponse>(
          '/proto.Question/DeleteAnswer',
          ($0.AnswerIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteAnswerResponse.fromBuffer(value));
  static final _$listAnswers =
      $grpc.ClientMethod<$0.ListAnswersRequest, $0.Answers>(
          '/proto.Question/ListAnswers',
          ($0.ListAnswersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Answers.fromBuffer(value));

  QuestionClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.Empty> migrate($0.MigrateRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$migrate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.User> getUser($0.GetUserRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Users> listUsers($0.ListUserRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listUsers, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Campaign> getCampaign($0.GetCampaignRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getCampaign, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Campaigns> listCampaigns(
      $0.ListCampaignRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listCampaigns, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SupportRole> getSupportRole(
      $0.GetSupportRoleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getSupportRole, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SupportRoles> listSupportRoles(
      $0.ListSupportRoleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listSupportRoles, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.NewAnswerResponse> newAnswer(
      $0.NewAnswerRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$newAnswer, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Answer> getAnswer($0.AnswerIdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getAnswer, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DeleteAnswerResponse> deleteAnswer(
      $0.AnswerIdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteAnswer, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Answers> listAnswers($0.ListAnswersRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAnswers, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class QuestionServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Question';

  QuestionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MigrateRequest, $1.Empty>(
        'Migrate',
        migrate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MigrateRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUserRequest, $0.Users>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUserRequest.fromBuffer(value),
        ($0.Users value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCampaignRequest, $0.Campaign>(
        'GetCampaign',
        getCampaign_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetCampaignRequest.fromBuffer(value),
        ($0.Campaign value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCampaignRequest, $0.Campaigns>(
        'ListCampaigns',
        listCampaigns_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListCampaignRequest.fromBuffer(value),
        ($0.Campaigns value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSupportRoleRequest, $0.SupportRole>(
        'GetSupportRole',
        getSupportRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSupportRoleRequest.fromBuffer(value),
        ($0.SupportRole value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSupportRoleRequest, $0.SupportRoles>(
        'ListSupportRoles',
        listSupportRoles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListSupportRoleRequest.fromBuffer(value),
        ($0.SupportRoles value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewAnswerRequest, $0.NewAnswerResponse>(
        'NewAnswer',
        newAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewAnswerRequest.fromBuffer(value),
        ($0.NewAnswerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AnswerIdRequest, $0.Answer>(
        'GetAnswer',
        getAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AnswerIdRequest.fromBuffer(value),
        ($0.Answer value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AnswerIdRequest, $0.DeleteAnswerResponse>(
        'DeleteAnswer',
        deleteAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AnswerIdRequest.fromBuffer(value),
        ($0.DeleteAnswerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAnswersRequest, $0.Answers>(
        'ListAnswers',
        listAnswers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListAnswersRequest.fromBuffer(value),
        ($0.Answers value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> migrate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MigrateRequest> request) async {
    return migrate(call, await request);
  }

  $async.Future<$0.User> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.Users> listUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListUserRequest> request) async {
    return listUsers(call, await request);
  }

  $async.Future<$0.Campaign> getCampaign_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetCampaignRequest> request) async {
    return getCampaign(call, await request);
  }

  $async.Future<$0.Campaigns> listCampaigns_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListCampaignRequest> request) async {
    return listCampaigns(call, await request);
  }

  $async.Future<$0.SupportRole> getSupportRole_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetSupportRoleRequest> request) async {
    return getSupportRole(call, await request);
  }

  $async.Future<$0.SupportRoles> listSupportRoles_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListSupportRoleRequest> request) async {
    return listSupportRoles(call, await request);
  }

  $async.Future<$0.NewAnswerResponse> newAnswer_Pre($grpc.ServiceCall call,
      $async.Future<$0.NewAnswerRequest> request) async {
    return newAnswer(call, await request);
  }

  $async.Future<$0.Answer> getAnswer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AnswerIdRequest> request) async {
    return getAnswer(call, await request);
  }

  $async.Future<$0.DeleteAnswerResponse> deleteAnswer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AnswerIdRequest> request) async {
    return deleteAnswer(call, await request);
  }

  $async.Future<$0.Answers> listAnswers_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListAnswersRequest> request) async {
    return listAnswers(call, await request);
  }

  $async.Future<$1.Empty> migrate(
      $grpc.ServiceCall call, $0.MigrateRequest request);
  $async.Future<$0.User> getUser(
      $grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.Users> listUsers(
      $grpc.ServiceCall call, $0.ListUserRequest request);
  $async.Future<$0.Campaign> getCampaign(
      $grpc.ServiceCall call, $0.GetCampaignRequest request);
  $async.Future<$0.Campaigns> listCampaigns(
      $grpc.ServiceCall call, $0.ListCampaignRequest request);
  $async.Future<$0.SupportRole> getSupportRole(
      $grpc.ServiceCall call, $0.GetSupportRoleRequest request);
  $async.Future<$0.SupportRoles> listSupportRoles(
      $grpc.ServiceCall call, $0.ListSupportRoleRequest request);
  $async.Future<$0.NewAnswerResponse> newAnswer(
      $grpc.ServiceCall call, $0.NewAnswerRequest request);
  $async.Future<$0.Answer> getAnswer(
      $grpc.ServiceCall call, $0.AnswerIdRequest request);
  $async.Future<$0.DeleteAnswerResponse> deleteAnswer(
      $grpc.ServiceCall call, $0.AnswerIdRequest request);
  $async.Future<$0.Answers> listAnswers(
      $grpc.ServiceCall call, $0.ListAnswersRequest request);
}
