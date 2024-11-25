import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../network/dio_service.dart';
import '../../../network/model/product.dart';
import '../../../repository/data_repository/data_repository.dart';

part 'list_product_event.dart';

part 'list_product_state.dart';

class ListProductBloc extends Bloc<ListProductEvent, ListProductState> {
  final DataRepository _dataRepository =
  GetIt.I<DataRepository>(instanceName: "DBRepository");

  ListProductBloc() : super(ListProductState()) {
    on<InitListProductEvent>(_initEvent);
    on<AddToCartListProductEvent>(_addToCart);
  }

  FutureOr<void> _initEvent(InitListProductEvent event,
      Emitter<ListProductState> emit) async {
    List<Product> value =
    await GetIt.I<DioMethods>(instanceName: "DioMethods").getProducts();
    emit(state.copyWith(products: value));
  }

  FutureOr<void> _addToCart(AddToCartListProductEvent event,
      Emitter<ListProductState> emit) async {
    Product? productInCart = await _dataRepository.getCartProductFromCart(
        event.product.productId);
    if (productInCart == null) {
      _dataRepository.saveProductToCart(event.product);
    }
  }
}
