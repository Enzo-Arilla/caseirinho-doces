import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/inputProfile.dart';
import 'package:caseirinhodoces/model/user.dart';
import 'package:flutter/material.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final user = UserProfileSingleton.instance.user; 
    String? profileImageUrl;
    String? name;

    if (user != null)
    {
        profileImageUrl = user.profileImageUrl;
        name = user.name;
    }

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            width: 300,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          profileImageUrl ?? '',
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          name ?? '',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                  // Foto e nome
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          profileImageUrl ?? '',
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        name ?? '',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),*/
                  const SizedBox(height: 50),
              
                  // Email
                  const Text(
                    'Seu email:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const InputProfile(hintText: 'stemiller@gmail.com', enabled: false),
                  const SizedBox(height: 40),
              
                  // Nome
                  const Text(
                    'Seu nome:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const InputProfile(hintText: 'Nome', enabled: true),
                  const SizedBox(height: 40),
              
                  // Endereço
                  const Text(
                    'Seu endereço:',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const InputProfile(
                    hintText: 'Endereço',
                    enabled: true,
                    minLines: 3,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 40),
              
                  // Botão
                  Button(label: "Alterar", onPressed: () {

                    if (!formKey.currentState!.validate())
                      return;

                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}