import 'package:get/get.dart';
import 'package:lac_buffet/scr/models/cart_item_model.dart';
import 'package:lac_buffet/scr/models/item_model.dart';
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

  double cartTotalPrice() {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  Future<bool> changeItemQuantity({
    required item,
    required int quantity,
  }) async {
    final result = await cartRepository.changItemQuantity(
      token: authcontroller.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    if (result) {
      if (quantity == 0) {
        cartItems.removeWhere((cartItem) => cartItem.id == cartItem.id);
      } else {
        cartItems
            .firstWhere((cartItem) => cartItem.id == cartItem.id)
            .quantity = quantity;
      }
      update();
    } else {
      utilsServices.showToast(
        message: 'Ocorreu um erro ao alterar a quantidade do produ',
        isError: true,
      );
    }

    return result;
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
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  Future<void> addItemToCart(
      {required ItemModel item, int quantity = 1}) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];

      await changeItemQuantity(
        item: product,
        quantity: (product.quantity + quantity),
      );

      //Já existe
    } else {
      final CartResult<String> result = await cartRepository.addItemToCart(
        userId: authcontroller.user.id!,
        token: authcontroller.user.token!,
        productId: item.id,
        quantity: quantity,
      );

      result.when(
        success: (cartItemId) {
          cartItems.add(CartItemModel(
            id: cartItemId,
            quantity: quantity,
            item: item,
          ));
        },
        erro: (message) {
          utilsServices.showToast(
            message: message,
            isError: true,
          );
        },
      );
    }

    update();
  }
}
