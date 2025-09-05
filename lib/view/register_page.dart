import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(width: 350, child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Text(
                'Criar uma conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent
                ),
              ),
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Digite seu nome',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ), Input(hintText: 'Nome completo')]),
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Digite seu e-mail',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ), Input(hintText: 'E-mail')]),
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Digite sua senha',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ), Input(hintText: 'Senha')]),
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Repita sua senha',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ), Input(hintText: 'Confirmar senha')]),
              Button(label: 'Começar!', onPressed: (){}),
            ],
          ))
        ) 
      )
    );

  }

  

}