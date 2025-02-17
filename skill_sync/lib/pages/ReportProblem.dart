import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/AccessCourses.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';  // Para manipulação de arquivos


class ReportProblem extends StatefulWidget {
  const ReportProblem({Key? key}) : super(key: key);

  @override
  State<ReportProblem> createState() => _ReportProblem();
}

  class _ReportProblem extends State<ReportProblem> {

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

  final List<String> categoria = [
    'Bug no Sistema',
    'Dúvida ou Pergunta',
    'Problema de Performance',
    'Outro',
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
          icon: Icon(Icons.report_problem, color: Colors.yellow,),
          content: Container(
            child: Text(
              'Seu report foi salvo. Caso seja necessário, o suporte entrará em contato com você para maiores esclarecimentos.',
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
                    'Reportar Problema',
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
                  //Inserir Categoria do problema
                  SizedBox(
                    width: 290,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.report_problem_outlined, color: Colors.yellow,),
                        border: OutlineInputBorder(),
                        labelText: 'Categoria',
                        hintText: 'Categoria',
                        helperText: 'Obrigatório',
                        filled: true,
                        fillColor: Color(0xFFB4CBEC),
                      ),
                      value: categoriaSelecionado,
                      onChanged: (String? novoValor) {
                        setState(() {
                          categoriaSelecionado = novoValor;
                        });
                      },
                      items: categoria.map((String categoria) {
                        return DropdownMenuItem<String>(
                          value: categoria,
                          child: Text(categoria),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Descrição do Problema
                  SizedBox(
                    width: 290,
                    child: TextField(
                      maxLines: 5,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.report_problem, color: Colors.yellow,),
                        border: OutlineInputBorder(),
                        labelText: 'Problema',
                        hintText: 'Descrição do problema...',
                        helperText: 'Obrigatório',
                        filled: true,
                        fillColor: Color(0xFFB4CBEC),
                    ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Inserir Departamento
                  SizedBox(
                    width: 290,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.work),
                        border: OutlineInputBorder(),
                        labelText: 'Departamento',
                        helperText: 'Obrigatório',
                        filled: true,
                        fillColor: Color(0xFFB4CBEC),
                      ),
                      value: departamentoSelecionado,
                      onChanged: (String? novoValor) {
                        setState(() {
                          departamentoSelecionado = novoValor;
                        });
                      },
                      items: departamentos.map((String departamento) {
                        return DropdownMenuItem<String>(
                          value: departamento,
                          child: Text(departamento),
                        );
                      }).toList(),
                    ),
                  ),
                  //SizedBox(height: 10),
                    //Verificar como colocar imagem
                  SizedBox(height: 25),
                  //Botão Reportar Problema
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog();
                    },
                    child: const Text('Reportar Problema'),
                  ),
                ],
              ),
            )
        )
    );
  }
}
