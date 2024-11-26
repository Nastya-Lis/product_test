part of 'list_product_bloc.dart';

enum Status {
  init,
  loading,
  loaded,
  error,
}

class ListProductState {
  final List<Product> products;
  final String errorMessage;
  final Status status;
  final bool isShowedDialog;

  ListProductState({
    this.products = const [],
    this.errorMessage = "",
    this.isShowedDialog = false,
    this.status = Status.init,
  });

  ListProductState copyWith({
    List<Product>? products,
    String? errorMessage,
    bool? isShowedDialog,
    Status? status,
  }) {
    return ListProductState(
        products: products ?? this.products,
        errorMessage: errorMessage ?? "",
        isShowedDialog: isShowedDialog ?? this.isShowedDialog,
        status: status ?? this.status);
  }
}
