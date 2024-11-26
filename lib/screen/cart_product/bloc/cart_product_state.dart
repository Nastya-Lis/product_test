part of 'cart_product_bloc.dart';

class CartProductState {
  final List<Product>? productsCart;

  CartProductState({
    this.productsCart = const [],
  });

  CartProductState copyWith({
    List<Product>? productsCart,
  }) {
    return CartProductState(
      productsCart: productsCart ?? this.productsCart,
    );
  }
}
