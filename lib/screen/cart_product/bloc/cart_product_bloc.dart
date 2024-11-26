import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/network/model/product.dart';
import 'package:example/repository/data_repository/data_repository.dart';
import 'package:get_it/get_it.dart';

part 'cart_product_event.dart';

part 'cart_product_state.dart';

class CartProductBloc extends Bloc<CartProductEvent, CartProductState> {
  final DataRepository _dataRepository =
      GetIt.I<DataRepository>(instanceName: "DBRepository");

  CartProductBloc() : super(CartProductState()) {
    on<InitCartProductEvent>(_initCartProduct);
    on<ChangeQuantityCartProductEvent>(_changeQuantity);
  }

  FutureOr<void> _initCartProduct(
      InitCartProductEvent event, Emitter<CartProductState> emit) async {
    emit(state.copyWith(
      productsCart: await _dataRepository.getCartProducts(),
    ));
  }

  FutureOr<void> _changeQuantity(ChangeQuantityCartProductEvent event,
      Emitter<CartProductState> emit) async {
    if (event.quantityChange == QuantityChange.decrease) {
      if (event.product.quantity == 1) {
        _dataRepository.deleteProductFromCart(event.product);
      } else {
        event.product.quantity = event.product.quantity! - 1;
        _dataRepository.updateProduct(event.product);
      }
    }
    if (event.quantityChange == QuantityChange.increase) {
      event.product.quantity = event.product.quantity! + 1;
      _dataRepository.updateProduct(event.product);
    }
    emit(state.copyWith(
      productsCart: await _dataRepository.getCartProducts(),
    ));
  }
}
