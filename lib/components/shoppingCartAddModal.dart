import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/view/main_page.dart';
import 'package:flutter/material.dart';

class ShoppingCartAddModal extends StatelessWidget {
  const ShoppingCartAddModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.shopping_bag,
            color: Color(0xFFF4709D),
            size: 40,
          ),
          const SizedBox(height: 10),
          const Text(
            "Produto inserido na sacola!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Button(
            label: "Continuar comprando",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
