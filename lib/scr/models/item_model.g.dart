// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String? ?? '',
      description: json['description'] as String,
      imfUrl: json['picture'] as String,
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      itemname: json['title'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.itemname,
      'picture': instance.imfUrl,
      'unit': instance.unit,
      'price': instance.price,
      'description': instance.description,
    };
