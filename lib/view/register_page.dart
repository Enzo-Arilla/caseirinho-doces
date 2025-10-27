import 'package:caseirinhodoces/bloc/manager_bloc.dart';
import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/inputForm.dart';
import 'package:caseirinhodoces/model/user.dart';
import 'package:caseirinhodoces/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerRepeatPassword = TextEditingController();
  
  final formKey = GlobalKey<FormState>();
  String? _sexo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4709D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Criar uma conta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4709D),
                        ),
                      ),
                      const SizedBox(height: 24),
      
                      // Nome
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite seu nome',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ),
                      InputForm(controller: controllerName, hintText: 'Nome completo', enabled: true),
                      const SizedBox(height: 16),
      
                      // Email
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite seu e-mail',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ),
                      InputForm(controller: controllerEmail, hintText: 'E-mail', enabled: true),
                      const SizedBox(height: 16),
      
                      // Senha
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite sua senha',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ),
                      InputForm(controller: controllerPassword, hintText: 'Senha', enabled: true),
                      const SizedBox(height: 16),
      
                      // Confirmar senha
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Repita sua senha',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ),
                      InputForm(controller: controllerRepeatPassword, hintText: 'Confirmar senha', enabled: true),
                      const SizedBox(height: 16),
      
                      // Sexo
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sexo',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Masculino'),
                              leading: Radio<String>(
                                value: 'Masculino',
                                groupValue: _sexo,
                                onChanged: (value) {
                                  setState(() {
                                    _sexo = value;
                                  });
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFF4709D),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Feminino'),
                              leading: Radio<String>(
                                value: 'Feminino',
                                groupValue: _sexo,
                                onChanged: (value) {
                                  setState(() {
                                    _sexo = value;
                                  });
                                },
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFF4709D),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
      
                      // Botão principal
                      Builder(
                        builder: (context) => Button(
                          label: 'Começar!',
                          onPressed: () {
                            if (!formKey.currentState!.validate()) return;
                            if (_sexo == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Selecione o sexo"),
                                  backgroundColor: Color(0xFFF96697),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              return;
                            }
                              
                            ManagerBloc bloc = BlocProvider.of<ManagerBloc>(context);
                            UserProfile user = UserProfile(
                                idGoogle: '',
                                name: controllerName.text,
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                                address: '',
                                sex: _sexo,
                                profileImageUrl: '');
                            bloc.add(RegisterEvent(user: user));
                              
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
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
      
                      // Google
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implementar login com Google
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 13),
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
                            const SizedBox(width: 20),
                            const Text(
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
        ),
      ),
    );
  }
}
