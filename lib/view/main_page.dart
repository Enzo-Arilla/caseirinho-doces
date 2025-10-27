import 'package:caseirinhodoces/components/navigationBarCustom.dart';
import 'package:caseirinhodoces/components/productAddFavoriteModal.dart';
import 'package:caseirinhodoces/components/productCard.dart';
import 'package:caseirinhodoces/control/shopping_cart_change_notifier.dart';
import 'package:caseirinhodoces/model/user.dart';
import 'package:caseirinhodoces/view/favorite_products_page.dart';
import 'package:caseirinhodoces/view/history_page.dart';
import 'package:caseirinhodoces/view/profile_user_page.dart';
import 'package:caseirinhodoces/view/shopping_cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    final user = UserProfileSingleton.instance.user; 
    String? profileImageUrl;
    String? name;

    if (user != null)
    {
        profileImageUrl = user.profileImageUrl;
        name = user.name;
    }

    return ProductInheritedWidget(
      productChangeNotifier: productNotifier,
      child: Scaffold(
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
                      bottom: BorderSide(color: Color(0xFFF4709D), width: 2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 97,
                        height: 110,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          profileImageUrl ?? '',
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.person, size: 60, color: Colors.white)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name ?? 'Não identificado',
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
                title: const Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {

                  if (user != null)
                  {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }
                },
              ),
              const Divider(color: Colors.white, thickness: 1, height: 0),
              ListTile(
                tileColor: const Color(0xFFF4709D),
                leading: Image.asset("assets/images/favoritos_menuLateral.png"),
                title: const Text(
                  "Favoritos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteProductsPage(
                      productNotifier: productNotifier,
                      onUpdate: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.white, thickness: 1, height: 0),
              ListTile(
                tileColor: const Color(0xFFF4709D),
                leading: Image.asset("assets/images/relogio_menuLateral.png"),
                title: const Text(
                  "Histórico de Pedidos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                ),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                              child: Image.asset(
                                  'assets/images/cesta_compras.png'),
                            ),
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
                          child: const Row(
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
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        onFavoriteTap: () {
                          setState(() {
                            if (!product.isFavorite) {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return ProductAddFavoriteModal();
                                },
                              );
                            }
                            productNotifier.updateIsFavorite(
                                productNotifier.products.indexOf(product));
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
        bottomNavigationBar: NavigationBarCustom(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
