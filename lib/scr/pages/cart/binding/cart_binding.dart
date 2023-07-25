import 'package:get/get.dart';
import 'package:lac_buffet/scr/pages/cart/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CartController(),
    );
  }
}
