import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lac_buffet/scr/models/cart_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  DateTime createdDateTime;

  @JsonKey(name: 'due')
  DateTime overduaDateTime;
  @JsonKey(defaultValue: [])
  List<CartItemModel> items;
  String status;

  String qrCodeImage;

  @JsonKey(name: 'copiaecola')
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overduaDateTime,
    required this.items,
    required this.status,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
