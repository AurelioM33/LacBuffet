// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  @JsonKey(name: 'title')
  String itemname;
  @JsonKey(name: 'picture')
  String imfUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    this.id = '',
    required this.description,
    required this.imfUrl,
    required this.unit,
    required this.price,
    required this.itemname,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, itemname: $itemname, imfUrl: $imfUrl, unit: $unit, price: $price, description: $description)';
  }
}
