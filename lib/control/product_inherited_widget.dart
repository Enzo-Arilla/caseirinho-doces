import 'package:caseirinhodoces/control/product_change_notifier.dart';
import 'package:flutter/material.dart';

class ProductInheritedWidget extends InheritedWidget {
  ProductChangeNotifier productChangeNotifier;

  ProductInheritedWidget(
      {required super.child, required this.productChangeNotifier});

  static ProductChangeNotifier of(BuildContext context) {
    return context
          .dependOnInheritedWidgetOfExactType<ProductInheritedWidget>()!
          .productChangeNotifier;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
