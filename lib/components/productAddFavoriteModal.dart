import 'package:flutter/material.dart';

class ProductAddFavoriteModal extends StatelessWidget {
  const ProductAddFavoriteModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.favorite,
            color: Color(0xFFF96697),
          ),
          SizedBox(width: 10),
          Text("Produto adicionado aos favoritos!"),
        ],
      ),
    );
  }
}
