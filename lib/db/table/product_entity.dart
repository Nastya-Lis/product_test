class ProductDbEntities {
  final int id;
  String title;
  String description;
  double price;
  String images;
  String thumbnail;
  int quantity;

  ProductDbEntities(this.id, this.title, this.description, this.price,
        this.images, this.thumbnail, this.quantity);
}
