import 'package:flutter/material.dart';
import 'package:skill_sync/pages/AccessCourses.dart';
import 'package:skill_sync/pages/LoginPage.dart';
import 'package:skill_sync/pages/Profile.dart';
import 'package:skill_sync/pages/RecoverLogin.dart';
import 'package:skill_sync/pages/ReportProblem.dart';
import 'package:skill_sync/pages/TeamHistoryPage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';  // Para manipulação de arquivos
//import 'package:skill_sync/pages/KitsPage.dart';
import 'package:skill_sync/pages/EvidencePage.dart';
import 'package:skill_sync/pages/EquipmentPage.dart';
import 'package:skill_sync/pages/Support.dart';

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
        '/fourth':(context) => const ReportProblem(), //Abre a página para Reportar um Problema
        '/fifth':(context) => const EvidencePage(), //Abre a página de Evidências
        '/sixth':(context) => const EquipmentPage(), //Abre a página de Equipamentos
        //'/seventh':(context) => const KitsPage(), //Abre a página de Kits
        '/eighth': (context) => const TeamHistoryPage(),//Abre a página de Histórico de Equipe
        //'/ninth':
        '/tenth': (context) => const Support(),//Abre a página de Suporte
       // '/eleventh': (context) => const (),//Abre a página de Equipamentos

      },
    );
  }
}

