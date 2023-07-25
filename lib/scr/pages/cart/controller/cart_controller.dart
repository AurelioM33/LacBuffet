import 'package:get/get.dart';
import 'package:lac_buffet/scr/pages/auth/controller/auth_controller.dart';
import 'package:lac_buffet/scr/pages/cart/repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authcontroller = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    await cartRepository.getCartItems(
      token: authcontroller.user.token!,
      userId: authcontroller.user.id!,
    );
  }
}
