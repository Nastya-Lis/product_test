import 'package:example/network/model/product.dart';

abstract class ProductService {

  init();

  Future<List<Product>> getCartProducts();

  Future<Product?> getCartProduct(int id);

  Future<void> insertCartProduct(Product product);

  Future<void> updateCartProduct(Product product);

  Future<void> deleteCartProduct(Product product);

  Future<void> insertListCartProducts(List<Product> products);
}
