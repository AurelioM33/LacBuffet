import 'package:get/get.dart';
import 'package:lac_buffet/scr/constants/storage_keys.dart';
import 'package:lac_buffet/scr/models/user_model.dart';
import 'package:lac_buffet/scr/pages/auth/repository/auth_repository.dart';
import 'package:lac_buffet/scr/pages/auth/result/auth_result.dart';
import 'package:lac_buffet/scr/pages_routes/app_pages.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();
  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedTobase();
      },
      error: (message) {
        singOut();
      },
    );
  }

  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }

  Future<void> singOut() async {
//Zerar o user
    user = UserModel();
//Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);
//Ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedTobase() {
//Salvar o token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

//Ir para a base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedTobase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedTobase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
