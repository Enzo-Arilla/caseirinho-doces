import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:caseirinhodoces/components/inputProfile.dart';
import 'package:flutter/material.dart';
import 'package:caseirinhodoces/components/navigationBarCustom.dart';

class ProfileUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto circular
                  Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/perfil.png", fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 20),
                  // Nome
                  const Text(
                    "Stephani\nMiler",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), 
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seu email:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                ),
              InputProfile(hintText: 'ste@gmail.com', enabled: false),
              const SizedBox(height: 40), 
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seu nome:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                ),
              InputProfile(hintText: 'Stephani Miler', enabled: true),
              const SizedBox(height: 40), 
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seu endereço:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                ),
              InputProfile(hintText: '', enabled: true, minLines: 3, maxLines: 5),
              const SizedBox(height: 40), 
              Button(label: "Alterar", onPressed: (){})
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarCustom(
        selectedIndex: 0,
        onItemTapped: (int a) {},
      ),
    );
  }
}
