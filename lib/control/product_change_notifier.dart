import 'package:caseirinhodoces/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductChangeNotifier extends ChangeNotifier {

  final List<Product> products = [
    Product(imagePath: "assets/images/trufa1.png", description: "Trufa", isFavorite: true, rate: 4.9, numberOfReviews: 355),
    Product(imagePath: "assets/images/paodemel1.png", description: "Pão de Mel", isFavorite: true, rate: 4.8, numberOfReviews: 105),
    Product(imagePath: "assets/images/bolodepote1.png", description: "Bolo de pote", isFavorite: false, rate: 4.6, numberOfReviews: 500),
    Product(imagePath: "assets/images/trufa1.png", description: "Trufa", rate: 4.9, isFavorite: true, numberOfReviews: 355),
    Product(imagePath: "assets/images/paodemel1.png", description: "Pão de Mel", isFavorite: false, rate: 4.8, numberOfReviews: 105),
    Product(imagePath: "assets/images/bolodepote1.png", description: "Bolo de pote", isFavorite: false, rate: 4.6, numberOfReviews: 500)
  ];

  updateIsFavorite(int index) {
    products[index].isFavorite = !products[index].isFavorite;
    notifyListeners();
  }

}
