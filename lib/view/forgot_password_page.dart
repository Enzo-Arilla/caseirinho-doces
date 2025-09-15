import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:caseirinhodoces/view/login_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF7F7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/caseirinho_logo.png',
                width: 200,
              ),
              Text('Sua senha deve ter pelo menos 8 caracteres',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
              textAlign: TextAlign.center),
              Padding(padding: const  EdgeInsets.only(bottom: 100.0).add(const EdgeInsets.symmetric(horizontal: 30.0)), child: Column(children: [
                  Align(
                  alignment: Alignment.centerLeft,
                  child:Text('Digite sua senha',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  )),
                  Input(hintText: 'Nova senha'),
                  SizedBox(height: 20),
                  Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Text(
                    'Repita sua nova senha', textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  )), 
                  Input(hintText: 'Confirmar nova senha'),
                  SizedBox(height: 20),
                  Button(label: 'Alterar senha', onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  })
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
