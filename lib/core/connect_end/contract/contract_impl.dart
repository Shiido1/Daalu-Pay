import 'package:daalu_pay_admin/core/connect_end/model/get_all_user_response_model/get_all_user_response_model.dart';
import 'package:daalu_pay_admin/core/connect_end/model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/approve_receipt_entity_model.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);
  Future<GetAllUserResponseModel> getAllUsers() async => await _api.allUsers();
  Future<GetAdminStatsResponseModel> adminStats() async =>
      await _api.adminStats();
  Future<GetAdminTransactionsResponseModel> adminTransactions() async =>
      await _api.adminTransactions();
  Future<dynamic> approveUser(String id) async => await _api.approveUser(id);
  Future<dynamic> denyUser(String id) async => await _api.denyUser(id);
  Future<dynamic> suspendUser({String? id, String? text}) async =>
      await _api.suspendUser(id: id, text: text);
  Future<dynamic> unsuspendUser({String? id, String? text}) async =>
      await _api.unsuspendUser(id: id, text: text);
  Future<dynamic> delete(String id) async => await _api.delete(id);
  Future<dynamic> approveTransaction(String id) async =>
      await _api.approveTransactions(id);
  Future<dynamic> denyTransaction({String? id, String? text}) async =>
      await _api.denyTransactions(id: id, text: text);
  Future<GetUsersReceiptResponseModel> getUsersReceipts() async =>
      await _api.getUsersReceipts();
  Future<dynamic> approveReceipts(
          {String? id, ApproveReceiptEntityModel? approve}) async =>
      await _api.approveReceipts(id: id, approve: approve);
  Future<dynamic> denyReceipts({String? id, String? reason}) async =>
      await _api.denyReceipts(id: id, reason: reason);
  Future<PostUserVerificationCloudResponse> postCloudinary(
          PostUserCloudEntityModel postCloudinary) async =>
      await _api.postTocloudinary(postCloudinary);
}
