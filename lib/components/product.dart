import 'package:flutter/material.dart';

class Product extends StatelessWidget {

  final String imagePath;
  final String description;
  final double? rate;
  final int? numberOfReviews;

  const Product({ super.key, required this.imagePath, required this.description, this.rate, this.numberOfReviews });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Padding(padding: const EdgeInsets.only(top: 35.0)),
            Container(width: 300, height: 200, clipBehavior: Clip.antiAlias, decoration:  BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(imagePath, fit: BoxFit.cover)),
            Padding(padding: const EdgeInsets.only(top: 12.0)),
            Text(description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Padding(padding: const EdgeInsets.only(top: 2.0)),
            RichText(text: TextSpan(children: [WidgetSpan(child: Icon(Icons.star, color: Color(0xFFF4709D), size: 16)),
                                               TextSpan(text: " $rate ", style: TextStyle(color: Color(0xFFF96697))),
                                               TextSpan(text: "($numberOfReviews avaliações)", style: TextStyle(color: Colors.blueGrey))]))
          ],
      ));
  }
  
}