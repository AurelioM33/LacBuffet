import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lac_buffet/scr/config/custom_colors.dart';
import 'package:lac_buffet/scr/pages/cart/controller/cart_controller.dart';
import 'package:lac_buffet/scr/pages/cart/view/components/cart_tile.dart';
import 'package:lac_buffet/scr/pages/common_widgets/payment_dialog.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';
import 'package:lac_buffet/scr/config/app_data.dart' as appData;

class CardTab extends StatefulWidget {
  CardTab(Type cardTab, {super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  final UtilsServices utilsServices = UtilsServices();

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          //Lista de Itens do Carrinho

          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                if (controller.cartItems.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 40,
                        color: CustomColors.customSwatchColor,
                      ),
                      const Text('Não há items no carrinho'),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                    );
                  },
                );
              },
            ),
          ),

          // Total e Botão de concluir o pedido

          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Geral',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      GetBuilder<CartController>(
                        builder: (controller) {
                          return Text(
                            utilsServices.priceToCurrency(
                              controller.cartTotalPrice(),
                            ),
                            style: TextStyle(
                              fontSize: 23,
                              color: CustomColors.customSwatchColor,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: appData.orders.first,
                            );
                          },
                        );
                      } else {
                        utilsServices.showToast(
                            message: 'Pedido nao confirmado', isError: true);
                      }
                    },
                    child: Text(
                      'Concluir Pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (contesx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Confirmação'),
          content: Text('Deseja Realmente Concluir o Pedido ? '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
