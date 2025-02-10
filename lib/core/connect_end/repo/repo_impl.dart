import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_wallet_id_response_model/get_wallet_id_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_response_model/kyc_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_response_model/notification_user_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/deposit_wallet_response_model/deposit_wallet_response_model.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
import '../model/get_transaction_response_model/get_transaction_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/notification_user_entity_model.dart';
import '../model/register_entity_model.dart';
import '../model/user_response_model/user_response_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<RegistrationResponseModel> register(
      RegisterEntityModel registerEntity) async {
    final response = await _contract.register(registerEntity);
    return response;
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    final response = await _contract.login(loginEntity);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

  Future<UserResponseModel> userData() async {
    final response = await _contract.userData();
    return response;
  }

  Future<GetStatsResponseModel> getStatistics() async {
    final response = await _contract.getStatistics();
    return response;
  }

  Future<GetTransactionResponseModel> getTransactions() async {
    final response = await _contract.getTransactions();
    return response;
  }

  Future<GetExchangeRateResponseModel> exchangeRate(
      {String? from, String? to}) async {
    final response = await _contract.exchangeRate(from: from, to: to);
    return response;
  }

  Future<dynamic> createWallet(String currencyCode) async {
    final response = await _contract.createWallet(currencyCode: currencyCode);
    return response;
  }

  Future<dynamic> swap(SwapEntiyModel swap) async {
    final response = await _contract.swap(swap);
    return response;
  }

  Future<dynamic> updateProfile(RegisterEntityModel update) async {
    final response = await _contract.updateProfile(update);
    return response;
  }

  Future<UpdatePasswordResponseModel> updatePassword(
      UpdatePasswordEntity updatePassword) async {
    final response = await _contract.updatePassword(updatePassword);
    return response;
  }

  Future<dynamic> resetPassword(ResetPasswordEntity resetPassword) async {
    final response = await _contract.resetPassword(resetPassword);
    return response;
  }

  Future<dynamic> forgotPassword(String email) async {
    final response = await _contract.forgotPassword(email);
    return response;
  }

  Future<dynamic> requestOtp(String email) async {
    final response = await _contract.requestOtp(email);
    return response;
  }

  Future<dynamic> verifyOtp({String? otp, String? email}) async {
    final response = await _contract.verifyOtp(otp: otp, email: email);
    return response;
  }

  Future<dynamic> alipayVerify(AliPayEntityModel alipay) async {
    final response = await _contract.alipayVerify(alipay);
    return response;
  }

  Future<GetWalletIdResponseModel> getWalletId(String id) async {
    final response = await _contract.getWalletId(id);
    return response;
  }

  Future<dynamic> sendMoney(SendMonetEntityModel sendMoney) async {
    final response = await _contract.sendMoney(sendMoney);
    return response;
  }

  Future<DepositWalletResponseModel> depositWallet(
      DepositWalletEntityModel depositWallet) async {
    final response = await _contract.depositWallet(depositWallet);
    return response;
  }

  Future<KycResponseModel> kyc(KycEntityModel kyc) async {
    final response = await _contract.kyc(kyc);
    return response;
  }

  Future<NotificationUserResponseModel> notificationToke(
      NotificationUserEntityModel notificationUserEntity) async {
    final response = await _contract.notificationToken(notificationUserEntity);
    return response;
  }

  Future<dynamic> deleteNotificationToke(
      String id) async {
    final response = await _contract.deleteNotificationToken(id);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
