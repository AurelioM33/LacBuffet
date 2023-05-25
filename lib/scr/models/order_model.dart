// ignore_for_file: unused_import

import 'package:lac_buffet/scr/models/card_item_model.dart';
import 'package:lac_buffet/scr/models/item_model.dart';

class OrderModel {
  String id;
  DateTime createDateTime;
  DateTime overduaDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.createDateTime,
    required this.overduaDateTime,
    required this.id,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
