import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/AccessCourses.dart';


class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _Tests();
}

class _Tests extends State<Tests> {

  // Lista de departamentos
  final List<String> departamentos = [
    'Recursos Humanos',
    'Financeiro',
    'Desenvolvimento',
    'Infraestrutura',
    'Estoque',
    'Marketing',
    'Vendas',
  ];


  String? departamentoSelecionado;
  String? categoriaSelecionado;

  //Função para exibir diálogo
  _showConfirmationDialog(){
    showDialog(context: context,
        // Impede que o usuário feche o diálogo tocando fora dele
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(
            'Salvo',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
          icon: Icon(Icons.tips_and_updates_rounded, color: Colors.yellow[300], size: 40,),
          content: Container(
            child: Text(
              'Sua sugestão foi enviada com sucesso!',
              style: TextStyle(

                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Homenaje',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop(); // Fecha o diálogo
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AccessCourses()), // Substitua "LoginScreen" pela sua tela de login
                    (Route<dynamic> route) => false, // Remove todas as rotas anteriores
              );        },
              child: Text('OK'),
            ),
          ],
        )
    );
  }


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
