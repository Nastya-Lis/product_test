part of 'cart_product_bloc.dart';

class CartProductState {
  final List<Product>? productsCart;
  final int itemCartCount;

  CartProductState({
    this.productsCart = const [],
    this.itemCartCount = 0,
  });

  CartProductState copyWith({
    List<Product>? productsCart,
  }) {
    return CartProductState(
      productsCart: productsCart ?? this.productsCart,
      itemCartCount: productsCart != null ? productsCart.length : 0,
    );
  }
}
