import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:bootstrapper/rpc/v2/main_bootstrap_models.pb.dart';
import 'package:bootstrapper/rpc/v2/main_bootstrap_services.pbgrpc.dart';

class BootstrapRepo {
  static Future<ListBSResponse> listBootstrap() async {
    final req = ListBSRequest();
    try {
      final client = await bsClient();
      final resp = client
          .listBootstrap(req, options: await getCallOptions())
          .then((res) {
        return res;
      });
      return resp;
    } catch (e) {
      throw e;
    }
  }

  Stream<NewBSRequest> createBSUploadStream(
      {@required PlatformFile bsFile}) async* {
    final extension = bsFile.extension;
    final fileBytes = bsFile.bytes;
    final bsReq = NewBSRequest()..fileExtension = extension;
    yield bsReq;
    int size = 1024;
    for (var i = 0; i < fileBytes.length; i += size) {
      final dataRequest = NewBSRequest()
        ..bsRequest = fileBytes.sublist(
            i, i + size > fileBytes.length ? fileBytes.length : i + size);
      yield dataRequest;
    }
  }

  static Future<NewBSResponse> newBootstrap(
      {@required Stream<NewBSRequest> bsRequestStream}) async {
    try {
      final client = await bsClient();
      final resp =
          client.newBootstrap(bsRequestStream, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<void> executeBootstrap({@required String bsId}) async {
    final req = GetBSRequest()..fileId = bsId;
    try {
      final client = await bsClient();
      final resp =
          client.executeBootstrap(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deleteBootstrap({@required String bsId}) async {
    final req = GetBSRequest()..fileId = bsId;
    try {
      final client = await bsClient();
      final resp = client.deleteBootstrap(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<BS> getBootstrap({@required String bsId}) async {
    final req = GetBSRequest()..fileId = bsId;
    try {
      final client = await bsClient();
      final resp = client.getBootstrap(req, options: await getCallOptions());
      return resp;
    } catch (e) {
      throw e;
    }
  }

  static Future<BSServiceClient> bsClient() async {
    return BSServiceClient(await BaseRepo.grpcWebClientChannel());
  }
}
