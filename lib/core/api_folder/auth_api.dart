import 'package:daalu_pay/core/connect_end/model/add_account_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/add_account_response_model/add_account_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/all_exchange_rates_response_model/all_exchange_rates_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/create_pin_response_model/create_pin_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_response_model/deposit_wallet_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_bank_account_response_model/get_bank_account_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_message_response/get_message_response.dart';
import 'package:daalu_pay/core/connect_end/model/get_payment_gate_response_model/get_payment_gate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_stats_response_model/get_stats_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_wallet_id_response_model/get_wallet_id_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/initiate_chat_response_model/initiate_chat_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_response_model/kyc_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_response_model/notification_user_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/post_user_cloud_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import 'package:daalu_pay/core/connect_end/model/preference_response_model/preference_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/send_message_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/send_message_response_model/send_message_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/withdrawal_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/withdrawal_history_response_model/withdrawal_history_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/withdrawal_response_model/withdrawal_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../connect_end/model/get_swapped_transactions_response_model/get_swapped_transactions_response_model.dart';
import '../connect_end/model/login_entity.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/register_entity_model.dart';
import '../connect_end/model/update_user_entity_model.dart';
import '../connect_end/model/user_response_model/user_response_model.dart';
import '../connect_end/model/verify_pin_response_model/verify_pin_response_model.dart';
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

  Future<RegistrationResponseModel> register(
      RegisterEntityModel registerEntity) async {
    logger.d(registerEntity.toJson());
    try {
      final response = await _service.call(
          UrlConfig.register, RequestMethod.post,
          data: registerEntity.toJson());
      logger.d(response.data);
      return RegistrationResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

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

  Future<UserResponseModel> userData() async {
    try {
      final response = await _service.call(UrlConfig.user, RequestMethod.get);
      logger.d(response.data);
      return UserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetStatsResponseModel> getStatistics() async {
    try {
      final response =
          await _service.call(UrlConfig.statistics, RequestMethod.get);
      logger.d(response.data);
      return GetStatsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetTransactionResponseModel> getTransaction() async {
    try {
      final response =
          await _service.call(UrlConfig.transactions, RequestMethod.get);
      logger.d(response.data);
      return GetTransactionResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetExchangeRateResponseModel> exchangeRate(
      {String? from, String? to}) async {
    try {
      final response = await _service.call(
          UrlConfig.exchange_rates, RequestMethod.get,
          data: {'from': from, 'to': to});
      logger.d(response.data);
      return GetExchangeRateResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<AllExchangeRatesResponseModel> allExchangeRate() async {
    try {
      final response = await _service.call(
        UrlConfig.exchange_rates,
        RequestMethod.get,
      );
      logger.d(response.data);
      return AllExchangeRatesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> createWallet(String? currencyCode) async {
    try {
      final response = await _service.call(
          UrlConfig.wallets, RequestMethod.post,
          data: {'currency': currencyCode});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> swap(SwapEntiyModel? swapEntity) async {
    try {
      final response = await _service.call(UrlConfig.swap, RequestMethod.post,
          data: swapEntity!.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetSwappedTransactionsResponseModel> getSwap() async {
    try {
      final response = await _service.call(UrlConfig.swap, RequestMethod.get);
      logger.d(response.data);
      return GetSwappedTransactionsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> userProfile(UpdateUserEntityModel? userEntity) async {
    try {
      final response = await _service.call(UrlConfig.user, RequestMethod.post,
          data: FormData.fromMap(userEntity!.toJson()));
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> requestOtp(String? email) async {
    try {
      final response = await _service.call(
        '${UrlConfig.request_otp}?email=$email',
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> verifyOtp({String? otp, String? email}) async {
    try {
      final response = await _service.call(
          UrlConfig.verify_otp, RequestMethod.post,
          data: {'otp': otp, 'email': email});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> forgotPassword(String? email) async {
    try {
      final response = await _service.call(
          UrlConfig.forgot_password, RequestMethod.post,
          data: {'email': email});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> resetPassword(ResetPasswordEntity? resetPassword) async {
    try {
      final response = await _service.call(
          UrlConfig.reset_password, RequestMethod.post,
          data: resetPassword!.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UpdatePasswordResponseModel> updatePassword(
      UpdatePasswordEntity? updatePassword) async {
    try {
      final response = await _service.call(
          UrlConfig.update_password, RequestMethod.post,
          data: updatePassword!.toJson());
      logger.d(response.data);
      return UpdatePasswordResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> alipayVerify(AliPayEntityModel? alipay) async {
    logger.d(alipay?.toJson());
    try {
      final response = await _service.call(
          '${UrlConfig.wallets}/alipay/verify', RequestMethod.post,
          data: FormData.fromMap(alipay!.toJson()));
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetWalletIdResponseModel> getWalletId(String? id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.wallets}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetWalletIdResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> sendMoney(SendMonetEntityModel sendMoney) async {
    try {
      final response = await _service.call(
          '${UrlConfig.transfers}/send', RequestMethod.post,
          data: sendMoney.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DepositWalletResponseModel> depositWallet(
      DepositWalletEntityModel deposit) async {
    try {
      final response = await _service
          .call(UrlConfig.deposit, RequestMethod.post, data: deposit.toJson());
      logger.d(response.data);
      return DepositWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<KycResponseModel> kyc(KycEntityModel kyc) async {
    try {
      final response = await _service.call(UrlConfig.kyc, RequestMethod.post,
          data: kyc.toJson());
      logger.d(response.data);
      return KycResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<NotificationUserResponseModel> notificationToken(
      NotificationUserEntityModel notificationTokenEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.notification_token, RequestMethod.post,
          data: notificationTokenEntity.toJson());
      logger.d(response.data);
      return NotificationUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<PreferenceResponseModel> userPreference() async {
    try {
      final response =
          await _service.call(UrlConfig.user_preference, RequestMethod.get);
      logger.d(response.data);
      return PreferenceResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deletNotificationToken(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.notification_token}/$id', RequestMethod.delete);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<InitiateChatResponseModel> initiateChat() async {
    try {
      final response = await _service.call(UrlConfig.chat, RequestMethod.post);
      logger.d(response.data);
      return InitiateChatResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPaymentGateResponseModel> paymentGate() async {
    try {
      final response =
          await _service.call(UrlConfig.payment_gate, RequestMethod.get);
      logger.d(response.data);
      return GetPaymentGateResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetMessageResponse> getMessages(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.chat}/$id/messages', RequestMethod.get);
      logger.d(response.data);
      return GetMessageResponse.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SendMessageResponseModel> sendMessage(
      SendMessageEntityModel sendMessage) async {
    try {
      final response = await _service.call(
          '${UrlConfig.chat}/${sendMessage.chatId}/messages',
          RequestMethod.post,
          data: sendMessage.toJson());
      logger.d(response.data);
      return SendMessageResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
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

  Future<CreatePinResponseModel> createPin(String pin) async {
    try {
      final response = await _service
          .call(UrlConfig.create_pin, RequestMethod.post, data: {'pin': pin});
      logger.d(response.data);
      return CreatePinResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<VerifyPinResponseModel> verifyPin(String pin) async {
    try {
      final response = await _service
          .call(UrlConfig.verify_pin, RequestMethod.post, data: {'pin': pin});
      logger.d(response.data);
      return VerifyPinResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<AddAccountResponseModel> addAccount(
      AddAccountEntityModel addAccount) async {
    try {
      final response = await _service.call(
          UrlConfig.bank_account, RequestMethod.post,
          data: addAccount.toJson());
      logger.d(response.data);
      return AddAccountResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetBankAccountResponseModel> getAccount() async {
    try {
      final response =
          await _service.call(UrlConfig.bank_account, RequestMethod.get);
      logger.d(response.data);
      return GetBankAccountResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<WithdrawalResponseModel> withdrawalFund(
      WithdrawalEntityModel withdraw) async {
    try {
      final response = await _service.call(
          UrlConfig.user_withdraw, RequestMethod.post,
          data: withdraw.toJson());
      logger.d(response.data);
      return WithdrawalResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<WithdrawalHistoryResponseModel> withdrawalHistory() async {
    try {
      final response =
          await _service.call(UrlConfig.user_withdraw, RequestMethod.get);
      logger.d(response.data);
      return WithdrawalHistoryResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
