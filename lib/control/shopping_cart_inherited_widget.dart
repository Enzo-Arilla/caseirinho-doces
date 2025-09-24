import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:flutter/material.dart';

class ShoppingCartInheritedWidget extends InheritedWidget {
  ShoppingCartChangeNotifier shoppingCartChangeNotifier;

  ShoppingCartInheritedWidget(
      {required super.child, required this.shoppingCartChangeNotifier});

  static ShoppingCartChangeNotifier of(BuildContext context) {
    return context
          .dependOnInheritedWidgetOfExactType<ShoppingCartInheritedWidget>()!
          .shoppingCartChangeNotifier;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
