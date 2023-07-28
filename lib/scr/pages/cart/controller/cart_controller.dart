import 'package:get/get.dart';
import 'package:lac_buffet/scr/models/cart_item_model.dart';
import 'package:lac_buffet/scr/pages/auth/controller/auth_controller.dart';
import 'package:lac_buffet/scr/pages/cart/cart%20result/cart_result.dart';
import 'package:lac_buffet/scr/pages/cart/repository/cart_repository.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authcontroller = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authcontroller.user.token!,
      userId: authcontroller.user.id!,
    );
    result.when(
      success: (data) {
        cartItems = data;
        update();
      },
      erro: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }
}
