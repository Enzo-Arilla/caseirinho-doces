import 'package:caseirinhodoces/model/product.dart';
import 'package:caseirinhodoces/view/product_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoriteTap; // Callback para o clique no coração

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 35.0)),
          GestureDetector(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product: product)))
            },
            child: Container(
              width: 300,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(product.imagePath, fit: BoxFit.cover),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 12.0)),
          RichText(text: TextSpan(children: [TextSpan(text: product.description + ' ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), 
                                             WidgetSpan(child: GestureDetector(onTap: onFavoriteTap, child: product.isFavorite ? Icon(Icons.favorite, color: Color(0xFFF96697), size: 18) : 
                                                                                                           Icon(Icons.favorite_border, color: Color(0xFFF96697), size: 18)))])),
          const Padding(padding: EdgeInsets.only(top: 4.0)),
          RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(Icons.star, color: Color(0xFFF4709D), size: 16),
                ),
                TextSpan(
                    text: " ${product.rate} ",
                    style: const TextStyle(color: Color(0xFFF96697))),
                TextSpan(
                    text: "(${product.numberOfReviews} avaliações)",
                    style: const TextStyle(color: Colors.blueGrey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
