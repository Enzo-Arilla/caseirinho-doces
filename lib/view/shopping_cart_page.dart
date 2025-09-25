import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/productCart.dart';
import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:caseirinhodoces/view/login_page.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  final ShoppingCartChangeNotifier? shoppingCartChangeNotifier;
  final VoidCallback? onUpdate;

  ShoppingCartPage({super.key, required this.shoppingCartChangeNotifier, required this.onUpdate});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  late ShoppingCartChangeNotifier shoppingCartNotifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pega o ChangeNotifier da árvore de widgets
    shoppingCartNotifier = ShoppingCartSingleton.instance;
  }

  String? cupom;
  double descontoPercentual = 0.05; // 5%

  @override
  Widget build(BuildContext context) {

    List<ProductCart> cartItems = shoppingCartNotifier.cartItems;

    double total = cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
    double desconto = total * descontoPercentual;
    double subtotal = total - desconto;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sacola de compras",
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.brown,
                  ),
                ),
              ),
              const Divider(thickness: 2, color: Colors.blueGrey),
              // LISTA DE ITENS
              Expanded(
        child: ListView.separated(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return ProductCart(product: item.product, quantity: item.quantity, onRemove: () => setState(() {
          shoppingCartNotifier.removeFromCartItems(item.product.id);
        }), onIncrease: () =>
                        setState(() => shoppingCartNotifier.increaseQuantity(
                              item.product.id,
                            )), onDecrease: () =>
                        setState(() => shoppingCartNotifier.decreaseQuantity(
                              item.product.id,
                            )));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12), // espaço entre itens
        ),
      ),
              const Divider(thickness: 1, color: Colors.pinkAccent),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Valor Total", style: TextStyle(fontSize: 16)),
                  Text("R\$${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
      
              Row(
                children: [
                  const Text("Cupom de desconto?", style: TextStyle(color: Colors.pink, fontSize: 14)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Digite aqui",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      onChanged: (value) => setState(() => cupom = value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Desconto ${(descontoPercentual * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(fontSize: 16)),
                  Text("R\$${desconto.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 12),
      
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sub Total",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text("R\$${subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Button(label: 'Finalizar compra', onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  })
                  ]
                ),
              
              ),
            ],
          ),
        )
      );
  }
}