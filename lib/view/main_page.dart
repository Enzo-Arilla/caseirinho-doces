import 'package:caseirinhodoces/components/product.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  final List<Product> products = [
    Product(imagePath: "assets/images/trufa1.png", description: "Trufa", rate: 4.9, numberOfReviews: 355),
    Product(imagePath: "assets/images/paodemel1.png", description: "Pão de Mel", rate: 4.8, numberOfReviews: 105),
    Product(imagePath: "assets/images/bolodepote1.png", description: "Bolo de pote", rate: 4.6, numberOfReviews: 500),
    Product(imagePath: "assets/images/trufa1.png", description: "Trufa", rate: 4.9, numberOfReviews: 355),
    Product(imagePath: "assets/images/paodemel1.png", description: "Pão de Mel", rate: 4.8, numberOfReviews: 105),
    Product(imagePath: "assets/images/bolodepote1.png", description: "Bolo de pote", rate: 4.6, numberOfReviews: 500)
  ];

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xFFF4709D),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
  height: 210,
  child: DrawerHeader(
    margin: EdgeInsets.zero,  // remove margem
    padding: EdgeInsets.zero,
    decoration: const BoxDecoration(color: Color(0xFFF4709D), border: Border(bottom: BorderSide(color: Color(0xFFF4709D), width: 2))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // empurra para baixo
      crossAxisAlignment: CrossAxisAlignment.center, // alinha à esquerda
      children: [
        Container(
          width: 120,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/perfil.png"),
        ),
        const SizedBox(height: 8), // espaço entre imagem e texto
        const Text(
          "Stephani Miler",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),
              ListTile(
                tileColor: Color(0xFFF4709D),
                leading: Image.asset("assets/images/user_menuLateral.png"),
                title: Text("Perfil", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              Divider(color: Colors.white, thickness: 1, height: 0),
              ListTile(
                tileColor: Color(0xFFF4709D),
                leading: Image.asset("assets/images/favoritos_menuLateral.png"),
                title: Text("Favoritos", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              Divider(color: Colors.white, thickness: 1, height: 0),
              ListTile(
                tileColor: Color(0xFFF4709D),
                leading: Image.asset("assets/images/cartao_menuLateral.png"),
                title: Text("Métodos de Pagamento", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              Divider(color: Colors.white, thickness: 1, height: 0),
              ListTile(
                tileColor: Color(0xFFF4709D),
                leading: Image.asset("assets/images/relogio_menuLateral.png"),
                title: Text("Histórico de Pedidos", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              Divider(color: Colors.white, thickness: 1, height: 0),
            ],
          ),
        ),
  body: Column(
    children: [
      PreferredSize(
        preferredSize: Size.fromHeight(250), // altura total
        child: Container(
          color: Color(0xFFF4709D),
          padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16), // para status bar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                    icon: Icon(Icons.menu, color: Colors.white, size: 30),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
                  ),
                  Image.asset(
                    'assets/images/logo_branca.png',
                  ),
                  Image.asset('assets/images/cesta_compras.png'),
                ],
              ),
              SizedBox(height: 20),
              // Texto central
              Text(
                'Aqui cada sabor é feito com amor para adoçar o seu dia.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 20),
              // Barra de busca
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Busque por item',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child:
          ListView.builder(itemCount: products.length,
          itemBuilder: (context, position) {
            return products[position];
          })

      ),
      Padding(padding: EdgeInsets.only(bottom: 20.0),)
    ],
  ),
)

    );

  }

}