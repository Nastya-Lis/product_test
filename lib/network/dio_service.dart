import 'package:dio/dio.dart';
import 'package:example/constants.dart';
import 'package:example/network/model/product.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class DioService {
/*  static final DioService _singletone = DioService._internal();
  late Dio _dio;

  DioService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ));
  }

  factory DioService() {
    return _singletone;
  }*/
  late Dio _dio;

  Dio get dio => _dio;

  DioService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ));
  }
}

abstract class DioMethods {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int id);
}

class DioMethodsImpl extends DioMethods {
  final DioService dioService =
      GetIt.I.get<DioService>(instanceName: "DioService");

  @override
  Future<List<Product>> getProducts() async {
    Response response = await dioService.dio.get("/products");
    List<dynamic> data = response.data["products"];
    return data.map((element) => Product.fromJson(element, const Uuid().v4())).toList();
  }

  @override
  Future<Product> getProduct(int id) async {
    Response response = await dioService.dio.get("/products/$id}");
    var json = response.data;
    return Product.fromJson(json, const Uuid().v4());
  }
}
