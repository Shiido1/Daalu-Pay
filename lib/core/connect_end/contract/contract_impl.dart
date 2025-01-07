import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/register_entity_model/register_entity_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/registration_response_model/registration_response_model.dart';
import '../model/user_response_model/user_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);
  Future<RegistrationResponseModel> register(
          RegisterEntityModel registerEntity) async =>
      await _api.register(registerEntity);
  Future<UserResponseModel> userData() async => await _api.userData();
  Future<GetTransactionResponseModel> getTransactions() async =>
      await _api.getTransaction();
  Future<GetStatsResponseModel> getStatistics() async =>
      await _api.getStatistics();
}
