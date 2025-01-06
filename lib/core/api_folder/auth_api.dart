import 'package:injectable/injectable.dart';
import '../connect_end/model/login_entity.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

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

  Future<dynamic> csrfCookie() async {
    try {
      final response = await _service.call(
        UrlConfig.csrfCookie,
        RequestMethod.get,
      );
      logger.d(response.headers);
      return response.headers;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
