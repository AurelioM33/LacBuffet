import 'package:lac_buffet/scr/constants/endpoints.dart';
import 'package:lac_buffet/scr/models/cart_item_model.dart';
import 'package:lac_buffet/scr/pages/cart/cart%20result/cart_result.dart';
import 'package:lac_buffet/scr/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );

    if (result['result'] != null) {
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();

      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.erro(
          'Ocorreu um erro ao recuperar os items do carrinho');
    }
  }
}
