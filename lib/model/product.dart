class Product {

  String imagePath;
  String description;
  bool isFavorite;
  double? rate;
  int? numberOfReviews;

  Product({required this.imagePath, required this.description, required this.isFavorite, this.rate, this.numberOfReviews});

}