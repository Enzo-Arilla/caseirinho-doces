import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Input(hintText: 'Nome completo'),
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
                Input(hintText: 'E-mail'),
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
                Input(hintText: 'Senha'),
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
                Input(hintText: 'Confirmar senha'),
                SizedBox(height: 32),

                Button(label: 'Começar!', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
