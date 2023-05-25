import 'package:flutter/material.dart';
import 'package:lac_buffet/scr/pages/cart/cart_tab.dart';
import 'package:lac_buffet/scr/pages/home/view/home_tab.dart';
import '../orders/orders_tab.dart';
import '../profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomeTab(),
            CardTab(CardTab),
            OrdersTab(),
            ProfileTab(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            //pageController.jumpToPage(index);
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            );
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
