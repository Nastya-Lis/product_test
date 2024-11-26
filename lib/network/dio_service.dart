import 'package:dio/dio.dart';
import 'package:example/constants.dart';
import 'package:example/network/model/product.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class DioService {
  late Dio _dio;

  Dio get dio => _dio;

  DioService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioException exception, ErrorInterceptorHandler handler) {
      handler.next(exception);
    }));
  }
}

class DioErrorUtil {
  static String handleError(DioException error) {
    String errorDescription = '';
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout has expired';
        break;
      case DioExceptionType.cancel:
        errorDescription = 'The request was canceled';
        break;
      case DioExceptionType.connectionError:
        errorDescription = 'Connection error';
        break;
      default:
        errorDescription = 'Unknown error';
    }
    return errorDescription;
  }
}

abstract class DioMethods {
  String messageError = "";

  Future<List<Product>?> getProducts();
}

class DioMethodsImpl extends DioMethods {
  final DioService dioService =
      GetIt.I.get<DioService>(instanceName: "DioService");

  @override
  Future<List<Product>?> getProducts() async {
    try {
      Response response = await dioService.dio.get("/products");
      List<dynamic> data = response.data["products"];
      return data
          .map((element) => Product.fromJson(element, const Uuid().v4()))
          .toList();
    } on DioException catch (e) {
      messageError = DioErrorUtil.handleError(e);
      return null;
    }
  }
}
