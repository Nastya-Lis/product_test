import 'package:example/db/db_service/product_service.dart';
import 'package:example/db/db_service/product_service_impl.dart';
import 'package:example/network/dio_service.dart';
import 'package:example/repository/data_repository/data_repository.dart';
import 'package:example/repository/data_repository/db_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'db/product_db.dart';

class AppDependencies {
  static final AppDependencies _instance = AppDependencies._();

  factory AppDependencies() => _instance;

  AppDependencies._();

  final getIt = GetIt.I;

  Future<void> setUp() async {

    final Database db = await ProductDB().initDb();
    getIt.registerLazySingleton<Database>(() => db, instanceName: "Database");

    getIt.registerLazySingleton<ProductService>(() => ProductServiceImpl(),
        instanceName: "ProductService");
    getIt.registerSingleton<DataRepository>(DBRepository(),
        instanceName: "DBRepository");
    getIt.registerLazySingleton<DioService>(() => DioService(),
        instanceName: "DioService");
    getIt.registerLazySingleton<DioMethods>(() => DioMethodsImpl(),
        instanceName: "DioMethods");
    getIt.get<ProductService>(instanceName: "ProductService").init();
  }
}
