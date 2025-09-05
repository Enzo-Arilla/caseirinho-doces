import 'package:caseirinhodoces/view/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFF7F7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 55),
              Image.asset(
                'assets/images/caseirinho_logo.png',
                width: 200,
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 350,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Digite seu e-mail',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFFF96697),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Digite sua senha',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFFF96697),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4709D),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 13,
                      horizontal: 100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Esqueci minha senha',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    // Aqui você coloca a função de login com Google
                  },
                  style: ElevatedButton.styleFrom(
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
                      SizedBox(width: 12),
                      Text(
                        'Fazer login com Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(width: 350, height: 50, child:
                ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.8,
                        child: RegisterPage()
                      ); /*Container(
                        height: 200,
                        child: RegisterPage()
                      );*/
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF4709D),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: Text('Criar uma conta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
