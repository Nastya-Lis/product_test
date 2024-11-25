part of 'product_card_bloc.dart';

enum StatusProductCard { init, addToCart }

class ProductCardState {
  final Product? product;
  final bool isExistInCart;
  final StatusProductCard status;

  ProductCardState({
    this.product,
    this.isExistInCart = false,
    this.status = StatusProductCard.init,
  });

  ProductCardState copyWith({
    Product? product,
    bool? isExistInCart,
    StatusProductCard? status,
  }) {
    return ProductCardState(
      product: product ?? this.product,
      isExistInCart: isExistInCart ?? this.isExistInCart,
      status: status ?? this.status,
    );
  }
}
