import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:caseirinhodoces/view/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // Responsivo ao teclado
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Criar uma conta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Nome
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Digite seu nome',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Input(hintText: 'Nome completo', enabled: true),
                  SizedBox(height: 16),
      
                  // Email
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Digite seu e-mail',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Input(hintText: 'E-mail', enabled: true),
                  SizedBox(height: 16),
      
                  // Senha
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Digite sua senha',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Input(hintText: 'Senha', enabled: true),
                  SizedBox(height: 16),
      
                  // Confirmar senha
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Repita sua senha',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Input(hintText: 'Confirmar senha', enabled: true),
                  SizedBox(height: 32),
                  Button(label: 'Começar!', onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Cadastro realizado com sucesso!"),
                          backgroundColor: Color(0xFFF96697),
                          duration: Duration(seconds: 1),
                        ),
                      );
      
                      Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        });
                  }),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Google
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 12),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 1,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Cadastro com Google',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
