import 'package:flutter/material.dart';
import 'package:skill_sync/LoginPage.dart';

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
      },
    );
  }
}
