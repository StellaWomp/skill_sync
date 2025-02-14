import 'package:flutter/material.dart';
import 'package:skill_sync/pages/AccessCourses.dart';
import 'package:skill_sync/pages/LoginPage.dart';
import 'package:skill_sync/pages/RecoverLogin.dart';
import 'package:skill_sync/pages/RegisterLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner "Debug"
      title: 'Skill Sync',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Definindo a rota inicial
      routes: {
        '/': (context) => const LoginPage(),
        '/second':(context) => const AccessCourses(), //Vai para tela principal
        '/third':(context) => const Recoverlogin(),//Vai para tela Recuperar senha
        '/fourth':(context) => const RegisterLogin(), //Vai para tela Registrar-se
       // 'fifth':(context) => const Recoverlogin(), //Vai para tela Registrar-se
       // 'sixth':(context) => const Recoverlogin(),
      },
    );
  }
}
