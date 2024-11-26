import 'package:example/db/helper_db.dart';
import 'package:sqflite/sqflite.dart';

class ProductDB {
  static final ProductDB _productDB = ProductDB._internal();

  ProductDB._internal();

  factory ProductDB(){
    return _productDB;
  }

  Future<void> deleteDb() async {
    final String pathDbLocal = await getDatabasesPath();
    final String path = '$pathDbLocal/${HelperDB.dbName}';
    await databaseFactory.deleteDatabase(path);
  }

  Future<Database> initDb() async {
    final String pathDbLocal = await getDatabasesPath();
    final String path = '$pathDbLocal/${HelperDB.dbName}';

    return await openDatabase(path,
        version: HelperDB.versionDb,
        onCreate: (Database db, int version) =>
            _createDbWithTables(db, version));
  }

  Future<void> _createDbWithTables(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${ProductDbHelper.tableName}(
        ${ProductDbHelper.id} TEXT NOT NULL PRIMARY KEY ,
        ${ProductDbHelper.productId} INTEGER NOT NULL,
        ${ProductDbHelper.title} TEXT NOT NULL,
        ${ProductDbHelper.description} TEXT,
        ${ProductDbHelper.price} REAL NOT NULL,
        ${ProductDbHelper.quantity} INTEGER,
        ${ProductDbHelper.images} TEXT,
        ${ProductDbHelper.thumbnail} TEXT)   
       ''');

    await db.execute('''
        CREATE TABLE ${InventoryDbHelper.tableName}(
        ${InventoryDbHelper.id} INTEGER NOT NULL PRIMARY KEY ,
        ${InventoryDbHelper.title} TEXT NOT NULL,
        ${InventoryDbHelper.description} TEXT,
        ${InventoryDbHelper.price} REAL NOT NULL,
        ${InventoryDbHelper.images} TEXT,
        ${InventoryDbHelper.thumbnail} TEXT)   
       ''');
  }
}
