class Product {

  int id;
  String imagePath;
  String name;
  String description;
  bool isFavorite;
  double price;
  double? rate;
  int? numberOfReviews;

  Product({required this.id, required this.imagePath, required this.name, required this.description, required this.isFavorite, required this.price, this.rate, this.numberOfReviews});

}