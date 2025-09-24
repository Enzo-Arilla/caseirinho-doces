import 'package:caseirinhodoces/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductChangeNotifier extends ChangeNotifier {

  final List<Product> products = [
    Product(id: 1, imagePath: "assets/images/trufa1.png", name: "Trufa", description: "Trufa", isFavorite: true, price: 12.0, rate: 4.9, numberOfReviews: 355),
    Product(id: 2, imagePath: "assets/images/paodemel1.png", name: "Pão de Mel", description: "Pão de Mel", isFavorite: true, price: 15.0, rate: 4.8, numberOfReviews: 105),
    Product(id: 3, imagePath: "assets/images/bolodepote1.png", name: "Bolo de pote", description: "Bolo de pote", isFavorite: false, price: 10.5, rate: 4.6, numberOfReviews: 500),
    Product(id: 4, imagePath: "assets/images/trufa1.png", name: "Trufa", description: "Trufa", rate: 4.9, isFavorite: true, price: 11.5, numberOfReviews: 355),
    Product(id: 5, imagePath: "assets/images/paodemel1.png", name: "Pão de mel", description: "Pão de Mel", isFavorite: false, price: 12.34, rate: 4.8, numberOfReviews: 105),
    Product(id: 6, imagePath: "assets/images/bolodepote1.png", name: "Bolo de pote", description: "Bolo de pote", isFavorite: false, price: 5.65, rate: 4.6, numberOfReviews: 500),
    Product(id: 7, imagePath: "assets/images/bolodepote1.png", name: "Bolo de pote", description: "Bolo de pote", isFavorite: false, price: 5.65, rate: 4.6, numberOfReviews: 500),
    Product(id: 8, imagePath: "assets/images/paodemel1.png", name: "Pão de mel", description: "Pão de Mel", isFavorite: false, price: 12.34, rate: 4.8, numberOfReviews: 105),
    Product(id: 9, imagePath: "assets/images/paodemel1.png", name: "Pão de mel", description: "Pão de Mel", isFavorite: false, price: 12.34, rate: 4.8, numberOfReviews: 105),
  ];

  updateIsFavorite(int index) {
    products[index].isFavorite = !products[index].isFavorite;
    notifyListeners();
  }

}
