// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'product.dart';


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json, String id) => Product(
      id: id,
      productId: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.productId,
      //'productId': instance.productId,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
      'quantity': instance.quantity,
    };
