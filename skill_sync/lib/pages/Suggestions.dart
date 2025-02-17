import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/AccessCourses.dart';


class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  State<Suggestions> createState() => _Suggestions();
}

class _Suggestions extends State<Suggestions> {

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
        body: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topCenter,

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sugestões',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje'),
                  ),
                  SizedBox(height: 15),
                  //Inserir título
                  SizedBox(
                    width: 290,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.title_outlined),
                          border: OutlineInputBorder(),
                          labelText: 'Título',
                          hintText: 'Título',
                          helperText: 'Obrigatório',
                          filled: true,
                          fillColor: Color(0xFFB4CBEC)
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 10),
                  //Descrição do Problema
                  SizedBox(
                    width: 290,
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.tips_and_updates, color: Colors.yellow,),
                        border: OutlineInputBorder(),
                        labelText: 'Sugestões',
                        hintText: 'Compartilhe sua sugestão: ',
                        helperText: 'Obrigatório',
                        filled: true,
                        fillColor: Color(0xFFB4CBEC),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //Botão Enviar Sugestão
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog();
                    },
                    child: const Text('Enviar Sugestão'),
                  ),
                ],
              ),
            )
        )
    );
  }
}
