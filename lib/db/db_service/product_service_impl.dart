import 'package:example/db/db_service/product_service.dart';
import 'package:example/db/helper_db.dart';
import 'package:example/network/model/product.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class ProductServiceImpl implements ProductService {
  Database db = GetIt.I.get<Database>(instanceName: "Database");

  @override
  init() {
  }

  @override
  Future<void> deleteCartProduct(Product product) async {
    await db.delete(ProductDbHelper.tableName,
        where: '${ProductDbHelper.id} = ?', whereArgs: [product.id]);
  }

  @override
  Future<Product?> getCartProduct(int id) async {
    List<Map<String, Object?>> result = await db.query(
        ProductDbHelper.tableName,
        where: '${ProductDbHelper.productId} = ?',
        whereArgs: [id]);
    return result.isNotEmpty ? Product.fromMap(result.first) : null;
  }

  @override
  Future<List<Product>> getCartProducts() async {
    List<Product> models = [];
    List<Map<String, Object?>>? resultEntities =
        await db.query(ProductDbHelper.tableName);
    for (Map<String, Object?> entity in resultEntities) {
      models.add(Product.fromMap(entity));
    }
    return models;
  }

  @override
  Future<void> insertListCartProducts(List<Product> products) async {
    for (Product element in products) {
      await db.insert(ProductDbHelper.tableName, element.toMap());
    }
  }

  @override
  Future<void> insertCartProduct(Product product) async {
    await db.insert(ProductDbHelper.tableName, product.toMap());
  }

  @override
  Future<void> updateCartProduct(Product product) async {
    await db.update(ProductDbHelper.tableName, product.toMap(),
        where: '${ProductDbHelper.id} = ?', whereArgs: [product.id]);
  }
}
