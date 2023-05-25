import 'package:lac_buffet/scr/constants/endpoints.dart';
import 'package:lac_buffet/scr/models/user_model.dart';
import 'package:lac_buffet/scr/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:lac_buffet/scr/pages/auth/result/auth_result.dart';
import 'package:lac_buffet/scr/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      print(result['result']);

      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token,
        });
    return handleUserOrError(result);
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );
    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );
    return handleUserOrError(result);
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
        url: Endpoints.resetPassword,
        method: HttpMethods.post,
        body: {'email': email});
  }
}
