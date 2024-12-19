import 'package:daalu_pay/core/connect_end/model/Login/login_entity.dart';
import 'package:daalu_pay/core/connect_end/model/login/login_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<LoginModel> login(LoginEntityModel loginEntity) async {
    final response = await _contract.login(loginEntity);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
