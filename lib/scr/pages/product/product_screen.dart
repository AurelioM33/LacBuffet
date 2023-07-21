import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lac_buffet/scr/config/custom_colors.dart';
import 'package:lac_buffet/scr/models/item_model.dart';
import 'package:lac_buffet/scr/pages/base/controller/navigation_controller.dart';
import 'package:lac_buffet/scr/pages/common_widgets/quatity_widget.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cardItemQuantity = 1;
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //Conteudo

          Column(
            children: [
              Expanded(
                child: Hero(
                    tag: widget.item.imfUrl,
                    child: Image.network(widget.item.imfUrl)),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nome - Quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemname,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cardItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cardItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),

                      //Preço
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      //Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      //Botão

                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              15,
                            )),
                          ),
                          onPressed: () {
                            //Fechar

                            Get.back();
                            // Carrinho

                            navigationController
                                .navigatePageView(NavigationTabs.cart);
                          },
                          label: Text(
                            'Add no Carrinho',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(Icons.shopping_cart_outlined),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
