import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavigationBarCustom({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: Color(0xFFFFD6EB), // fundo claro
      elevation: 0, // sem sombra
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0, // remove texto visivelmente
      unselectedFontSize: 0,
      showSelectedLabels: false, // esconde label
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/perfil_menuInferior.png",
            width: 36,
            height: 36,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home_menuInferior.png",
            width: 36,
            height: 36,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/cesta_menuInferior.png",
            width: 36,
            height: 36,
          ),
          label: "",
        ),
      ],
    );
  }
}
