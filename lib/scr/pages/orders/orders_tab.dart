import 'package:flutter/material.dart';
import 'package:lac_buffet/scr/config/app_data.dart' as appData;

import 'components/order-tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (_, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) => OrderTile(
          order: appData.orders[index],
        ),
        itemCount: appData.orders.length,
      ),
    );
  }
}
