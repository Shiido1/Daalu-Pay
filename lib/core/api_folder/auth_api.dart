import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_stats_response_model/get_stats_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_wallet_id_response_model/get_wallet_id_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../connect_end/model/login_entity.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/register_entity_model.dart';
import '../connect_end/model/user_response_model/user_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<RegistrationResponseModel> register(
      RegisterEntityModel registerEntity) async {
    logger.d(registerEntity.toJson());
    try {
      final response = await _service.call(
          UrlConfig.register, RequestMethod.post,
          data: FormData.fromMap(registerEntity.toJson()));
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

  Future<dynamic> userProfile(RegisterEntityModel? userEntity) async {
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
          '${UrlConfig.wallets}/send', RequestMethod.post,
          data: sendMoney.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
