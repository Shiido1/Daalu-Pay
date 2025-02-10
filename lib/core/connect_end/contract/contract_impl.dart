import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_response_model/deposit_wallet_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_wallet_id_response_model/get_wallet_id_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_response_model/kyc_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/notification_user_response_model/notification_user_response_model.dart';
import '../model/register_entity_model.dart';
import '../model/registration_response_model/registration_response_model.dart';
import '../model/swap_entiy_model.dart';
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
  Future<GetExchangeRateResponseModel> exchangeRate(
          {String? from, String? to}) async =>
      await _api.exchangeRate(from: from, to: to);
  Future<dynamic> createWallet({String? currencyCode}) async =>
      await _api.createWallet(currencyCode);
  Future<dynamic> swap(SwapEntiyModel? swap) async => await _api.swap(swap);
  Future<dynamic> updateProfile(RegisterEntityModel? update) async =>
      await _api.userProfile(update);
  Future<dynamic> resetPassword(ResetPasswordEntity? resetPassword) async =>
      await _api.resetPassword(resetPassword);
  Future<dynamic> forgotPassword(String? email) async =>
      await _api.forgotPassword(email);
  Future<dynamic> requestOtp(String? email) async =>
      await _api.requestOtp(email);
  Future<dynamic> verifyOtp({String? otp, String? email}) async =>
      await _api.verifyOtp(otp: otp, email: email);
  Future<dynamic> alipayVerify(AliPayEntityModel alipay) async =>
      await _api.alipayVerify(alipay);
  Future<UpdatePasswordResponseModel> updatePassword(
          UpdatePasswordEntity? updatePassword) async =>
      await _api.updatePassword(updatePassword);
  Future<GetWalletIdResponseModel> getWalletId(String? id) async =>
      await _api.getWalletId(id);
  Future<dynamic> sendMoney(SendMonetEntityModel? sendMoney) async =>
      await _api.sendMoney(sendMoney!);
  Future<DepositWalletResponseModel> depositWallet(
          DepositWalletEntityModel? deposit) async =>
      await _api.depositWallet(deposit!);
  Future<KycResponseModel> kyc(KycEntityModel? kyc) async =>
      await _api.kyc(kyc!);
  Future<NotificationUserResponseModel> notificationToken(NotificationUserEntityModel? notificationTokenEntity) async =>
      await _api.notificationToken(notificationTokenEntity!);
  Future<dynamic> deleteNotificationToken(String? id) async =>
      await _api.deletNotificationToken(id!);
}
