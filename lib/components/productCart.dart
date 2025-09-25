import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:caseirinhodoces/model/product.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  final Product product;
  int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  ProductCart({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  set setQuantity(int newQuantity) {
    quantity = newQuantity; // Pode ser definido 1x, mas nunca mais alterado
  }

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {

  late ShoppingCartChangeNotifier shoppingCartNotifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pega o ChangeNotifier da árvore de widgets
    shoppingCartNotifier = ShoppingCartSingleton.instance;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagem
          ClipOval(
            child: Image.asset(
              widget.product.imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Nome e quantidade
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Botão diminuir
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "${widget.quantity}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Botão aumentar
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: widget.onIncrease,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Preço
          Text(
            "R\$${(widget.product.price * widget.quantity).toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Botão remover
          IconButton(
  icon: const Icon(Icons.close, color: Colors.pink),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remover item"),
        content: const Text("Tem certeza que deseja remover este produto do carrinho?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.onRemove(); 
            },
            child: const Text("Remover"),
          ),
        ],
      ),
    );
  },
),

        ],
      ),
    );
  }
}
