part of 'list_product_bloc.dart';

sealed class ListProductEvent {}

class InitListProductEvent extends ListProductEvent {}

class AddToCartListProductEvent extends ListProductEvent {
  final Product product;

  AddToCartListProductEvent({required this.product});
}
