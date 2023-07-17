// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:lac_buffet/scr/config/app_data.dart';

import 'item_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;
  @JsonKey(defaultValue: [])
  List<ItemModel> itens;

  @JsonKey(defaultValue: 0)
  int pagination;

  CategoryModel({
    required this.title,
    required this.id,
    required this.itens,
    required this.pagination,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() =>
      'CategoryModel(title: $title, id: $id, items:$items, paginatio:$pagination,)';
}
