import 'package:flutter/material.dart';

class ProductPage3 extends StatefulWidget {
  const ProductPage3({super.key});

  @override
  State<ProductPage3> createState() => _ProductPage3State();
}

class _ProductPage3State extends State<ProductPage3> {
  int quantity = 1;
  String selectedFlavor = "Mesclado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'assets/images/bolodepote2.png',
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
                    child: const Text(
                      "Trufa",
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
                const SizedBox(width: 16),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/65.jpg"),
                ),
                const SizedBox(width: 4),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/45.jpg"),
                ),
                const SizedBox(width: 8),
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
                    children: const [
                      Text("4.5",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_border,
                      color: Color(0xFFF476A0)),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Bolos de pote com camadas generosas de massa fofinha, recheios cremosos e sabores variados para adoçar qualquer momento.",
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
                items: ["Mesclado", "Morango", "Sonho de Valsa", "Ninho com Nutella"]
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

            const SizedBox(height: 20),

            // Preço e quantidade
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    "R\$15s,00",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF476A0)),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF476A0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
