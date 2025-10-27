import 'package:caseirinhodoces/bloc/manager_bloc.dart';
import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/input.dart';
import 'package:caseirinhodoces/components/modal.dart';
import 'package:caseirinhodoces/model/user.dart';
import 'package:caseirinhodoces/view/forgot_password_page.dart';
import 'package:caseirinhodoces/view/main_page.dart';
import 'package:caseirinhodoces/view/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {

  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => ManagerBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF7F7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              Image.asset(
                'assets/images/caseirinho_logo.png',
                width: 200,
              ),
              const SizedBox(height: 50),
              SizedBox(
        width: 350,
        child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Digite seu e-mail',
            style: TextStyle(color: Colors.blueGrey, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controllerEmail,
            decoration: InputDecoration(
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFF96697), width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'O campo do e-mail não pode ser vazio';
              return null;
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Digite sua senha',
            style: TextStyle(color: Colors.blueGrey, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Senha',
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xFFF96697), width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'O campo da senha não pode ser vazio';
              return null;
            },
          ),
        ],
      ),
        ),
      ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                        
                      if (!formKey.currentState!.validate())
                        return;
                        
                      ManagerBloc bloc = BlocProvider.of<ManagerBloc>(context);
                      bloc.add(LoginEvent(email: controllerEmail.text));
                        
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login realizado com sucesso!"),
                          backgroundColor: Color(0xFFF96697),
                          duration: Duration(seconds: 1),
                        ),
                      );
                        
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4709D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Modal(
                      title: 'Recuperação de senha',
                      widgets: [
                        Input(hintText: 'Digite o seu e-mail', enabled: true),
                        Button(
                          label: 'Recuperar Senha',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => Modal(
                                title: 'Código de Verificação',
                                widgets: [
                                  const Text(
                                    'Um código de verificação foi enviado para o seu e-mail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Input(
                                      hintText: 'Código de verificação',
                                      enabled: true),
                                  Button(
                                    label: 'Trocar senha',
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            const ForgotPasswordPage(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () async {
                    GoogleAuthProvider googleProvider = GoogleAuthProvider();
      
                    googleProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
                    googleProvider.addScope('https://www.googleapis.com/auth/userinfo.email');
                    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
      
                    UserProfileSingleton.instance.user = UserProfile(idGoogle: userCredential.user?.uid, name: userCredential.user?.displayName ?? '', email: userCredential.user?.email ?? '',
                                                                     password: '', address: '', sex: '', // SOLICITAR INFO PRO USUARIO
                                                                     profileImageUrl: userCredential.user?.photoURL ?? '');
      
                    if (UserProfileSingleton.instance.user != null)
                    {
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login realizado com sucesso!"),
                          backgroundColor: Color(0xFFF96697),
                          duration: Duration(seconds: 1),
                        ),
                      );
      
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 30),
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
                      const SizedBox(width: 12),
                      const Text(
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
              const SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return const FractionallySizedBox(
                            heightFactor: 0.8, child: RegisterPage());
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4709D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    'Criar uma conta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
