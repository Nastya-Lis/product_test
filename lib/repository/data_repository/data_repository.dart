import 'package:example/network/model/product.dart';

abstract class DataRepository {
  void init();

  Future<List<Product>> getCartProducts();

  Future<Product?> getCartProductFromCart(int id);

  void saveAllProducts(List<Product> list);

  void saveProductToCart(Product product);

  void updateProduct(Product product);

  void deleteProductFromCart(Product product);
}
