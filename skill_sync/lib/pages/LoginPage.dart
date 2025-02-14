import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SkillSync',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Homenaje'),
              ),
              SizedBox(height: 15),
              Container(
                child: Image.asset(
                  'imagens/imagem tela login - skill_sync.png',
                  width: 100,
                  height: 100,
                ),
              ),

              const Text(
                'Bem-vindo(a)!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              //const SizedBox(height: 30),

              //Caixas de Login
              SizedBox(
                width: 290,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    //border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 290,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    //border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 25),
              //Botão entrar
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Entrar'),
              ),
              //Esqueceu a senha
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navegando para a tela de recuperação de senha
                      Navigator.of(context).pushNamed('/third');
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors
                            .blue, // Deixe o texto com cor para parecer um link
                        decoration:
                            TextDecoration.underline, // Adiciona o sublinhado
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              //Cadastre-se
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ainda não possui uma conta?  ',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  Row(children: [
                    TextButton(
                      onPressed: () {
                        // Navegando para a tela de recuperação de senha
                        Navigator.of(context).pushNamed('/fourth');
                      },
                      child: Text(
                        'Registre-se?',
                        style: TextStyle(
                          color: Colors.black, // Deixe o texto com cor para parecer um link
                          decoration:
                          TextDecoration.underline, // Adiciona o sublinhado
                          fontWeight: FontWeight.bold,// Adiciona o negrito
                        ),
                      ),
                    )
                  ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
