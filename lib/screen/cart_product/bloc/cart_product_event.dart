part of 'cart_product_bloc.dart';

enum QuantityChange { increase, decrease }

sealed class CartProductEvent {}

class InitCartProductEvent extends CartProductEvent {}

class LoadingCartProductEvent extends CartProductEvent {}

class ChangeQuantityCartProductEvent extends CartProductEvent {
  final QuantityChange quantityChange;
  final Product product;

  ChangeQuantityCartProductEvent({
    required this.quantityChange,
    required this.product,
  });
}
