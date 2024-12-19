import 'package:daalu_pay/core/connect_end/model/Login/login_entity.dart';
import 'package:daalu_pay/core/connect_end/model/login/login_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);
}
