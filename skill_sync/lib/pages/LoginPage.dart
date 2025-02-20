import 'package:flutter/material.dart';
import 'package:skill_sync/pages/AccessCourses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/login.dart';
import '../services/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;

  final AuthService _authService = AuthService();

  void _login() async {
    if (_username.text.isEmpty || _password.text.isEmpty) {
     print('login');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final login = Login(
      username: _username.text,
      password: _password.text,
    );

    bool success = await _authService.login(login);

    setState(() {
      _isLoading = false;
    });

    if (success) {
     print( "Login bem-sucedido!");
      // Redirecionar para a tela principal ou página desejada
     Navigator.of(context).pushReplacementNamed('/second');
    } else {
     print("Erro no login. Verifique seus dados.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAAC0E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFAAC0E6),
        //title: const Text('Tela Login', style: TextStyle(center),),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Escolas Conectadas',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Homenaje'),
                ),
                SizedBox(height: 10),
                Container(
                  child: Image.asset(
                    'imagens/nbn.png',
                    width: 100,
                    height: 100,
                  ),
                ),

                const Text(
                  'Bem-vindo(a)!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                //const SizedBox(height: 30),
                SizedBox(height: 10),
                //Caixas de Login
                SizedBox(
                  width: 290,
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 1.8,
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: 290,
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(

                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 1.8,
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 1),
                //Esqueceu a senha
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navegando para a tela de recuperação de senha
                        Navigator.of(context).pushNamed('/third');
                      },
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: Colors.blue, // Deixe o texto com cor para parecer um link
                          decoration:
                          TextDecoration.underline,
                          decorationColor: Colors.blue,// Adiciona o sublinhado

                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25),
                //Botão entrar
                ElevatedButton(
                  onPressed: _login/*() {
                    Navigator.of(context).pushReplacementNamed('/second');
                  }*/,
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
