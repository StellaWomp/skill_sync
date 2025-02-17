import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/AccessCourses.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _Performance();
}

//Função para exibir diálogo
_showConfirmationDialog(){
  //Fazer regra de negocio para que
  //1 quando for iniciar o teste aparecer a mensagem inforando que não será possível refazer
  //2 quando iniciar será contador X tempo para que seja realizado teste
  //3 faça o teste com atenção pois ele irá influenciar no seu gráfico de desempenho
  //4"Continuar"
}


class _Performance extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF6EABE7),
        appBar: AppBar(
          backgroundColor: const Color(0xFF6EABE7),
          //title: const Text('Tela Login', style: TextStyle(center),),
        ),

    );
  }
}