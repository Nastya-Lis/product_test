part of 'product_card_bloc.dart';

@immutable
sealed class ProductCardEvent {}

class InitProductCardEvent extends ProductCardEvent {
  final Product product;

  InitProductCardEvent({required this.product});
}

class AddProductToCardEvent extends ProductCardEvent {}
