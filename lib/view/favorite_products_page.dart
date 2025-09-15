import 'package:flutter/material.dart';
import 'package:caseirinhodoces/components/navigationBarCustom.dart';
import 'package:caseirinhodoces/components/productCard.dart';
import 'package:caseirinhodoces/control/product_change_notifier.dart';
import 'package:caseirinhodoces/control/product_inherited_widget.dart';

class FavoriteProductsPage extends StatefulWidget {
  final ProductChangeNotifier productNotifier;
  final VoidCallback onUpdate;

  FavoriteProductsPage({super.key, required this.productNotifier, required this.onUpdate});

  @override
  State<FavoriteProductsPage> createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  late ProductChangeNotifier productNotifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pega o ChangeNotifier da árvore de widgets
    productNotifier = widget.productNotifier;
  }

  @override
  Widget build(BuildContext context) {
    // Filtra apenas produtos favoritos
    final favoriteProducts = productNotifier.products
        .asMap()
        .entries
        .where((entry) => entry.value.isFavorite)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Image.asset("assets/images/Xrosa.png", width: 28, height: 28),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Produtos favoritos",
                style: TextStyle(
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          const PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 2,
                height: 2,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final productIndex = favoriteProducts[index].key;
                final product = favoriteProducts[index].value;

                return ProductCard(
                  product: product,
                  onFavoriteTap: () {
                    productNotifier.updateIsFavorite(productNotifier.products.indexOf(product));
                        setState(() {
                        });
                    widget.onUpdate();;
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarCustom(
        selectedIndex: 0,
        onItemTapped: (int a) {},
      ),
    );
  }
}
