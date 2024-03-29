import 'package:json_annotation/json_annotation.dart';
import 'package:lac_buffet/scr/models/item_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: 'product')
  ItemModel item;
  String id;

  int quantity;

  CartItemModel({
    required this.id,
    required this.quantity,
    required this.item,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  double totalPrice() => item.price * quantity;

  @override
  String toString() =>
      'CartItemModel(item: $item, id:$id , quantity: $quantity)';
}
