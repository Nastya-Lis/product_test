import 'package:example/network/model/product.dart';
import 'package:example/repository/data_repository/data_repository.dart';
import 'package:get_it/get_it.dart';

import '../../db/db_service/product_service.dart';

class DBRepository extends DataRepository {
  final ProductService _productService =
      GetIt.I.get<ProductService>(instanceName: "ProductService");

  @override
  void deleteProductFromCart(Product product) async {
    await _productService.deleteCartProduct(product);
  }

  @override
  Future<List<Product>> getCartProducts() async {
    return await _productService.getCartProducts();
  }

  @override
  void saveAllProducts(List<Product> list) async {
    await _productService.insertListCartProducts(list);
  }

  @override
  Future<Product?> getCartProductFromCart(int id) async {
    return await _productService.getCartProduct(id);
  }

  @override
  void saveProductToCart(Product product) async {
    await _productService.insertCartProduct(product);
  }

  @override
  void updateProduct(Product product) async {
    await _productService.updateCartProduct(product);
  }
}
