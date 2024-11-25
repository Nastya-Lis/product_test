import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/repository/data_repository/data_repository.dart';
import 'package:example/repository/data_repository/db_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../network/dio_service.dart';
import '../../../network/model/product.dart';

part 'product_card_event.dart';

part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  final DataRepository _dataRepository =
      GetIt.I<DataRepository>(instanceName: "DBRepository");

  ProductCardBloc() : super(ProductCardState()) {
    on<InitProductCardEvent>(_initCard);
    on<AddProductToCardEvent>(_addToCart);
  }

  FutureOr<void> _initCard(
      InitProductCardEvent event, Emitter<ProductCardState> emit) async {
    Product? productInCart =
        await _dataRepository.getCartProductFromCart(event.product.productId);
    emit(state.copyWith(
        product: event.product,
        isExistInCart: productInCart == null ? false : true));
  }

  FutureOr<void> _addToCart(
      AddProductToCardEvent event, Emitter<ProductCardState> emit) async {
    if (state.product != null) {
      GetIt.I<DataRepository>(instanceName: "DBRepository")
          .saveProductToCart(state.product!);
    }
    emit(state.copyWith(isExistInCart: true));
  }
}
