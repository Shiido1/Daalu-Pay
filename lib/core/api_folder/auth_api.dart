import 'package:daalu_pay_admin/core/connect_end/model/approve_withdrawal_entity_model.dart';
import 'package:daalu_pay_admin/core/connect_end/model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import 'package:daalu_pay_admin/core/connect_end/model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import 'package:daalu_pay_admin/core/connect_end/model/get_all_user_response_model/get_all_user_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../connect_end/model/approve_receipt_entity_model.dart';
import '../connect_end/model/get_all_withdrawals_response_model/get_all_withdrawals_response_model.dart';
import '../connect_end/model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/post_user_cloud_entity_model.dart';
import '../connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/cloudinary_network_service.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final _serviceCloud = locator<CloudinaryNetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(UrlConfig.login, RequestMethod.post,
          data: loginEntity.toJson());
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAdminStatsResponseModel> adminStats() async {
    try {
      final response = await _service.call(UrlConfig.stats, RequestMethod.get);
      logger.d(response.data);
      return GetAdminStatsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllWithdrawalsResponseModel> getWithdrawals() async {
    try {
      final response =
          await _service.call(UrlConfig.withdrawal, RequestMethod.get);
      logger.d(response.data);
      return GetAllWithdrawalsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllUserResponseModel> allUsers() async {
    try {
      final response =
          await _service.call(UrlConfig.allUsers, RequestMethod.get);
      logger.d(response.data);
      return GetAllUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAdminTransactionsResponseModel> adminTransactions() async {
    try {
      final response =
          await _service.call(UrlConfig.transactions, RequestMethod.get);
      logger.d(response.data);
      return GetAdminTransactionsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> approveUser(String? id) async {
    try {
      final response = await _service.call(
          'users/$id/approve', RequestMethod.post,
          data: {"status": "approved"});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyUser(
    String? id,
  ) async {
    try {
      final response = await _service.call('users/$id/deny', RequestMethod.post,
          data: {"status": "rejected"});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> suspendUser({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'users/$id/suspend', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> unsuspendUser({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'users/$id/unsuspend', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> delete(
    String? id,
  ) async {
    try {
      final response = await _service.call(
        'users/$id/delete',
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> approveTransactions(
      String? id, ApproveWithdrawalEntityModel? approve) async {
    try {
      final response = await _service.call(
          'withdrawals/$id/approve', RequestMethod.post,
          data: approve?.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyTransactions({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'withdrawals/$id/deny', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<GetUsersReceiptResponseModel> getUsersReceipts() async {
    try {
      final response = await _service.call('transfers', RequestMethod.get);
      logger.d(response.data);
      return GetUsersReceiptResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> approveReceipts(
      {String? id, ApproveReceiptEntityModel? approve}) async {
    try {
      final response = await _service.call(
          'receipts/$id/approve', RequestMethod.post,
          data: approve?.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyReceipts({String? id, String? reason}) async {
    try {
      final response = await _service.call(
        'receipts/$id/deny',
        data: {'reason': reason},
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<PostUserVerificationCloudResponse> postTocloudinary(
      PostUserCloudEntityModel post) async {
    try {
      final response = await _serviceCloud.call(
          'upload', CloudRequestMethod.upload,
          data: FormData.fromMap(post.toJson()));
      logger.d(response.data);
      return PostUserVerificationCloudResponse.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
