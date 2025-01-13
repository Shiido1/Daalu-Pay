import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';

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

  Future<GetAdminStatsResponseModel> getAdminStats() async {
    final response = await _contract.adminStats();
    return response;
  }

  Future<GetAdminTransactionsResponseModel> getTransactions() async {
    final response = await _contract.adminTransactions();
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
