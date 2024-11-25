part of 'list_product_bloc.dart';

class ListProductState {
  final List<Product> products;

  ListProductState({
    this.products = const [],
  });

  ListProductState copyWith({
    List<Product>? products,
    bool? isInCart,
  }) {
    return ListProductState(
      products: products ?? this.products,
    );
  }
}
