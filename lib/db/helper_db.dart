class HelperDB {
  static const String dbName = "products.db";
  static const int versionDb = 1;
}

class ProductDbHelper {
  static const String tableName = "product_table";

  static const String id = "_id";
  static const String productId = "product_id";
  static const String title = "name";
  static const String description = "description";
  static const String price = "price";
  static const String quantity = "quantity";
  static const String images = "images";
  static const String thumbnail = "thumbnail";
}

class InventoryDbHelper {
  static const String tableName = "inventory_table";

  static const String id = "_id";
  static const String title = "name";
  static const String description = "description";
  static const String price = "price";
  static const String images = "images";
  static const String thumbnail = "thumbnail";
}
