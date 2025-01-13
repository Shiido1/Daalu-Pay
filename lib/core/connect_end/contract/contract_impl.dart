import 'package:daalu_pay_admin/core/connect_end/model/get_all_user_response_model/get_all_user_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';

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
}
