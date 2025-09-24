import 'package:caseirinhodoces/components/navigationBarCustom.dart';
import 'package:caseirinhodoces/components/productCard.dart';
import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:caseirinhodoces/view/favorite_products_page.dart';
import 'package:caseirinhodoces/view/profile_user_page.dart';
import 'package:caseirinhodoces/view/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:caseirinhodoces/control/product_change_notifier.dart';
import 'package:caseirinhodoces/control/product_inherited_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ProductChangeNotifier productNotifier = ProductChangeNotifier();

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = productNotifier.products;

    return ProductInheritedWidget(
      productChangeNotifier: productNotifier,
      child: MaterialApp(
        home: Scaffold(
          drawer: Drawer(
            backgroundColor: const Color(0xFFF4709D),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 210,
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF4709D),
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFF4709D), width: 2))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset("assets/images/perfil.png"),
                        ),
                        const SizedBox(height: 8),
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
                  tileColor: const Color(0xFFF4709D),
                  leading: Image.asset("assets/images/user_menuLateral.png"),
                  title: const Text("Perfil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileUserPage())),
                ),
                const Divider(color: Colors.white, thickness: 1, height: 0),
                ListTile(
                  tileColor: const Color(0xFFF4709D),
                  leading:
                      Image.asset("assets/images/favoritos_menuLateral.png"),
                  title: const Text("Favoritos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteProductsPage(productNotifier: productNotifier, onUpdate: (){setState(() {
                            
                          });},))),
                ),
                const Divider(color: Colors.white, thickness: 1, height: 0),
                ListTile(
                  tileColor: const Color(0xFFF4709D),
                  leading: Image.asset("assets/images/relogio_menuLateral.png"),
                  title: const Text("Histórico de Pedidos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(color: Colors.white, thickness: 1, height: 0),
              ],
            ),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: [ 
              ProfileUserPage(),
              Column(
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(250),
                  child: Container(
                    color: const Color(0xFFF4709D),
                    padding: const EdgeInsets.only(
                        top: 40, left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.menu,
                                    color: Colors.white, size: 30),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                              ),
                            ),
                            Image.asset('assets/images/logo_branca.png'),
                            GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                  ShoppingCartPage(shoppingCartChangeNotifier: ShoppingCartSingleton.instance, onUpdate: (){
                                    setState(() {
                                      
                                    });
                                  })));
                            }, child: Image.asset('assets/images/cesta_compras.png'))
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Cada sabor é feito com amor para adoçar o seu dia.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: const [
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
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        onFavoriteTap: () {
                          setState(() {
                            productNotifier.updateIsFavorite(productNotifier.products.indexOf(product));
                          });
                        },
                      );
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              ],
            ),
            ShoppingCartPage(
                shoppingCartChangeNotifier: ShoppingCartSingleton.instance,
                onUpdate: () {
                  setState(() {});
                },
              ),

            ],
          ),
          bottomNavigationBar: NavigationBarCustom(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
        ),
      ),
    );
  }
}
