import 'package:example/db/helper_db.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String id;
  int productId;
  String title;
  String description;
  double price;
  List<String> images;
  String thumbnail;
  int? quantity;

  Product(
      {required this.id,
      required this.productId,
      required this.title,
      required this.description,
      required this.price,
      required this.images,
      required this.thumbnail,
      this.quantity});

  factory Product.fromJson(Map<String, dynamic> json, String id) =>
      _$ProductFromJson(json, id);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  static Product fromMap(Map<String, Object?> map) {
    return Product(
      id: map[ProductDbHelper.id] as String,
      productId: map[ProductDbHelper.productId] as int,
      title: map[ProductDbHelper.title] as String,
      description: map[ProductDbHelper.description] as String,
      price: map[ProductDbHelper.price] as double,
      images: [map[ProductDbHelper.images] as String],
      thumbnail: map[ProductDbHelper.thumbnail] as String,
      quantity: map[ProductDbHelper.quantity] as int?,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      ProductDbHelper.id: id,
      ProductDbHelper.productId: productId,
      ProductDbHelper.title: title,
      ProductDbHelper.description: description,
      ProductDbHelper.price: price,
      ProductDbHelper.quantity: quantity ?? 1,
      ProductDbHelper.images: images.first,
      ProductDbHelper.thumbnail: thumbnail
    };
  }

  @override
  String toString() {
    return "id: $id, title: $title, description: $description, price: $price, quantity: $quantity";
  }
}
