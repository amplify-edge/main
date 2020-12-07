///
//  Generated code. Do not modify.
//  source: main_bootstrap_services.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'main_bootstrap_models.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'main_bootstrap_services.pb.dart';

class BSServiceClient extends $grpc.Client {
  static final _$newBootstrap =
      $grpc.ClientMethod<$0.NewBSRequest, $0.NewBSResponse>(
          '/v2.main_bootstrap.services.BSService/NewBootstrap',
          ($0.NewBSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.NewBSResponse.fromBuffer(value));
  static final _$getBootstrap = $grpc.ClientMethod<$0.GetBSRequest, $0.BS>(
      '/v2.main_bootstrap.services.BSService/GetBootstrap',
      ($0.GetBSRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BS.fromBuffer(value));
  static final _$listBootstrap =
      $grpc.ClientMethod<$0.ListBSRequest, $0.ListBSResponse>(
          '/v2.main_bootstrap.services.BSService/ListBootstrap',
          ($0.ListBSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListBSResponse.fromBuffer(value));
  static final _$executeBootstrap =
      $grpc.ClientMethod<$0.GetBSRequest, $1.Empty>(
          '/v2.main_bootstrap.services.BSService/ExecuteBootstrap',
          ($0.GetBSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteBootstrap =
      $grpc.ClientMethod<$0.GetBSRequest, $1.Empty>(
          '/v2.main_bootstrap.services.BSService/DeleteBootstrap',
          ($0.GetBSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  BSServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.NewBSResponse> newBootstrap(
      $async.Stream<$0.NewBSRequest> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$newBootstrap, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.BS> getBootstrap($0.GetBSRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBootstrap, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ListBSResponse> listBootstrap(
      $0.ListBSRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listBootstrap, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> executeBootstrap($0.GetBSRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$executeBootstrap, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> deleteBootstrap($0.GetBSRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteBootstrap, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class BSServiceBase extends $grpc.Service {
  $core.String get $name => 'v2.main_bootstrap.services.BSService';

  BSServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.NewBSRequest, $0.NewBSResponse>(
        'NewBootstrap',
        newBootstrap,
        true,
        false,
        ($core.List<$core.int> value) => $0.NewBSRequest.fromBuffer(value),
        ($0.NewBSResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBSRequest, $0.BS>(
        'GetBootstrap',
        getBootstrap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBSRequest.fromBuffer(value),
        ($0.BS value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBSRequest, $0.ListBSResponse>(
        'ListBootstrap',
        listBootstrap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListBSRequest.fromBuffer(value),
        ($0.ListBSResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBSRequest, $1.Empty>(
        'ExecuteBootstrap',
        executeBootstrap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBSRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBSRequest, $1.Empty>(
        'DeleteBootstrap',
        deleteBootstrap_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBSRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.BS> getBootstrap_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBSRequest> request) async {
    return getBootstrap(call, await request);
  }

  $async.Future<$0.ListBSResponse> listBootstrap_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListBSRequest> request) async {
    return listBootstrap(call, await request);
  }

  $async.Future<$1.Empty> executeBootstrap_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBSRequest> request) async {
    return executeBootstrap(call, await request);
  }

  $async.Future<$1.Empty> deleteBootstrap_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBSRequest> request) async {
    return deleteBootstrap(call, await request);
  }

  $async.Future<$0.NewBSResponse> newBootstrap(
      $grpc.ServiceCall call, $async.Stream<$0.NewBSRequest> request);
  $async.Future<$0.BS> getBootstrap(
      $grpc.ServiceCall call, $0.GetBSRequest request);
  $async.Future<$0.ListBSResponse> listBootstrap(
      $grpc.ServiceCall call, $0.ListBSRequest request);
  $async.Future<$1.Empty> executeBootstrap(
      $grpc.ServiceCall call, $0.GetBSRequest request);
  $async.Future<$1.Empty> deleteBootstrap(
      $grpc.ServiceCall call, $0.GetBSRequest request);
}
