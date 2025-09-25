import 'package:caseirinhodoces/components/productAddFavoriteModal.dart';
import 'package:caseirinhodoces/components/shoppingCartAddModal.dart';
import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:caseirinhodoces/control/shopping_cart_inherited_widget.dart';
import 'package:caseirinhodoces/model/product.dart';
import 'package:caseirinhodoces/view/shopping_cart_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {

  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final ShoppingCartChangeNotifier shoppingCartNotifier = ShoppingCartSingleton.instance;

  int quantity = 1;
  String selectedFlavor = "Maracujá";

  @override
  Widget build(BuildContext context) {

    final Product product = widget.product;

    return ShoppingCartInheritedWidget(
      shoppingCartChangeNotifier: shoppingCartNotifier,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem principal
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      product.imagePath,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context); // volta para a página anterior
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5E5959),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        product.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      
              const SizedBox(height: 16),
      
              // Avaliação
              Row(
                children: [
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Color(0xFF5E5959), blurRadius: 5)
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(product.rate!.toStringAsFixed(1),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.orange, size: 18),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: product.isFavorite ? Icon(Icons.favorite, color: Color(0xFFF96697), size: 18) : 
                                               Icon(Icons.favorite_border, color: Color(0xFFF96697), size: 18),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                ],
              ),
      
              // Descrição
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Descrição",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  product.description,
                  style: TextStyle(color: Color(0xFF5E5959)),
                ),
              ),
      
              const SizedBox(height: 16),
      
              // Reviews
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Latest Reviews",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text("⭐⭐⭐ Sarah Jane\nA entrega atrasou um pouco."),
                    SizedBox(height: 6),
                    Text("⭐⭐⭐⭐⭐ James Allen\nMaravilhoso como sempre!!!"),
                  ],
                ),
              ),
      
              const SizedBox(height: 20),
      
              // Sabores
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Sabores",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: DropdownButtonFormField<String>(
                  value: selectedFlavor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  items: ["Maracujá", "Morango", "Coco", "Chocolate"]
                      .map((sabor) =>
                          DropdownMenuItem(value: sabor, child: Text(sabor)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFlavor = value!;
                    });
                  },
                ),
              ),
      
              const SizedBox(height: 30),
      
              // Preço e quantidade
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4709D),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.white,),
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
                    ),
                    const Spacer(),
                    Text(
                      "R\$ ${(product.price * quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    GestureDetector(onTap: (){
                                setState(() {
                                  
                                  showModalBottomSheet(
  context: context,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) {
    return ShoppingCartAddModal();
  },
);

                                  shoppingCartNotifier.addToCartItems(product, quantity);
                                /*Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                  ShoppingCartPage(shoppingCartChangeNotifier: shoppingCartNotifier, onUpdate: (){setState(() {
                                    
                                  });},)));*/
                                });
                    }, child: Image.asset('assets/images/cesta_compras.png'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
