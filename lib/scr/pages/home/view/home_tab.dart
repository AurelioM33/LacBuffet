import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import "package:badges/badges.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lac_buffet/scr/config/custom_colors.dart';
import 'package:lac_buffet/scr/config/app_data.dart' as appData;
import 'package:lac_buffet/scr/pages/common_widgets/app_name_widget.dart';
import 'package:lac_buffet/scr/pages/common_widgets/custom_shimmer.dart';
import 'package:lac_buffet/scr/pages/home/controller/home_controller.dart';
import 'package:lac_buffet/scr/pages/home/view/components/item_tile.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeContent: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                badgeColor: CustomColors.customConstrastcolor,
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            //Pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise Aqui',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customConstrastcolor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            //Categorias
            GetBuilder<HomeController>(
              builder: (controller) {
                return Container(
                  padding: EdgeInsets.only(left: 25),
                  height: 40,
                  child: SizedBox(
                    child: !controller.isLoading
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return CategoryTile(
                                onPressed: (() {
                                  controller.selectCategory(
                                      controller.allCategories[index]);
                                }),
                                category: controller.allCategories[index].title,
                                isSelected: controller.allCategories[index] ==
                                    controller.currentCategory,
                              );
                            },
                            separatorBuilder: (_, index) => SizedBox(width: 10),
                            itemCount: controller.allCategories.length,
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 12),
                                child: CustomShimmer(
                                  height: 20,
                                  width: 80,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),

            //Grid

            GetBuilder<HomeController>(
              builder: (controller) {
                return Expanded(
                  child: !controller.isLoading
                      ? GridView.builder(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 9 / 11.5),
                          itemCount: appData.items.length,
                          itemBuilder: (context, index) {
                            return ItemTile(
                                item: appData.items[index],
                                cartAnimationMethod:
                                    itemSelectedCartAnimations);
                          },
                        )
                      : GridView.count(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                            10,
                            (index) => CustomShimmer(
                              height: double.infinity,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
