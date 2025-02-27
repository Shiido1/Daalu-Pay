import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/approve_receipt_entity_model.dart';
import '../model/approve_withdrawal_entity_model.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/get_all_withdrawals_response_model/get_all_withdrawals_response_model.dart';
import '../model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    final response = await _contract.login(loginEntity);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

  Future<GetAllUserResponseModel> getAllUsers() async {
    final response = await _contract.getAllUsers();
    return response;
  }

  Future<GetAllWithdrawalsResponseModel> withdrawals() async {
    final response = await _contract.getWithdrawal();
    return response;
  }

  Future<GetAdminStatsResponseModel> getAdminStats() async {
    final response = await _contract.adminStats();
    return response;
  }

  Future<GetAdminTransactionsResponseModel> getTransactions() async {
    final response = await _contract.adminTransactions();
    return response;
  }

  Future<dynamic> approveUser(String id) async {
    final response = await _contract.approveUser(id);
    return response;
  }

  Future<dynamic> denyUser(String id) async {
    final response = await _contract.denyUser(id);
    return response;
  }

  Future<dynamic> suspendUser({String? id, String? text}) async {
    final response = await _contract.suspendUser(id: id, text: text);
    return response;
  }

  Future<dynamic> unsuspendUser({String? id, String? text}) async {
    final response = await _contract.unsuspendUser(id: id, text: text);
    return response;
  }

  Future<dynamic> delete(String id) async {
    final response = await _contract.delete(id);
    return response;
  }

  Future<dynamic> approveTransaction(
      String id, ApproveWithdrawalEntityModel approve) async {
    final response = await _contract.approveTransaction(id, approve);
    return response;
  }

  Future<dynamic> denyTransaction({String? id, String? text}) async {
    final response = await _contract.denyTransaction(id: id, text: text);
    return response;
  }

  Future<GetUsersReceiptResponseModel> getUsersReceipts() async {
    final response = await _contract.getUsersReceipts();
    return response;
  }

  Future<dynamic> approveReceipts(
      {String? id, ApproveReceiptEntityModel? approve}) async {
    final response = await _contract.approveReceipts(id: id, approve: approve);
    return response;
  }

  Future<dynamic> denyReceipts({String? id, String? reason}) async {
    final response = await _contract.denyReceipts(id: id, reason: reason);
    return response;
  }

  Future<PostUserVerificationCloudResponse> postCloudinary(
      PostUserCloudEntityModel postCloudinary) async {
    final response = await _contract.postCloudinary(postCloudinary);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
