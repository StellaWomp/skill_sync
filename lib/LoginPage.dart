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
      backgroundColor: const Color(0xFFE5E8FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E8FD),
        //title: const Text('Tela Login', style: TextStyle(centerr),),
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
                style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Homenaje'),
              ),
              SizedBox(height: 15),
              Container(
                child: Image.asset('imagens/imagem tela login - skill_sync.png',
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
              ElevatedButton(
                onPressed: () {},
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
