import 'package:caseirinhodoces/components/productCart.dart';
import 'package:caseirinhodoces/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartChangeNotifier extends ChangeNotifier {

  final List<ProductCart> cartItems = [];

  addToCartItems(Product product, int quantity) {
    // cartItems.add(new ProductCart(product: product, quantity: quantity, onRemove: () { }, onIncrease: (){}, onDecrease: (){}));
    // notifyListeners();

    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(ProductCart(product: product, quantity: quantity, onRemove: () { }, onIncrease: (){}, onDecrease: (){}));
    }
    notifyListeners();
  }

  removeFromCartItems(int productId) {
    cartItems.removeWhere((productCart) => productCart.product.id == productId);
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }
}

class ShoppingCartSingleton {
  static final ShoppingCartChangeNotifier instance = ShoppingCartChangeNotifier();
}