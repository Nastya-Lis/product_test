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
    on<LoadingListProductEvent>(_loadingEvent);
    on<AddToCartListProductEvent>(_addToCart);
  }

  FutureOr<void> _initEvent(
      InitListProductEvent event, Emitter<ListProductState> emit) async {
    emit(state.copyWith(status: Status.init, isShowedDialog: false));
    final dio = GetIt.I<DioMethods>(instanceName: "DioMethods");
    List<Product>? value = await dio.getProducts();
    if (value == null) {
      emit(state.copyWith(
          errorMessage: dio.messageError,
          isShowedDialog: true,
          status: Status.error));
    } else {
      emit(state.copyWith(
          products: value, isShowedDialog: false, status: Status.loaded));
    }
  }

  FutureOr<void> _addToCart(
      AddToCartListProductEvent event, Emitter<ListProductState> emit) async {
    Product? productInCart =
        await _dataRepository.getCartProductFromCart(event.product.productId);
    if (productInCart == null) {
      _dataRepository.saveProductToCart(event.product);
    }
  }

  FutureOr<void> _loadingEvent(
      LoadingListProductEvent event, Emitter<ListProductState> emit) {
    emit(state.copyWith(status: Status.loading, isShowedDialog: false));
  }
}
