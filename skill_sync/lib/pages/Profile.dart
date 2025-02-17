import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/AccessCourses.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  //Função para exibir diálogo
  _showConfirmationDialog() {
    showDialog(
      context: context,
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
        icon: Icon(
          Icons.report_problem,
          color: Colors.yellow,
        ),
        content: Container(
          child: Text(
            'Alterações Salvas.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AccessCourses()),
                    (Route<dynamic> route) => false,
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EABE7),
      appBar: AppBar(
        title: const Text("Perfil de Usuário"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto de perfil
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('imagens/fotoperfil.png'),
                ),
              ),
              SizedBox(height: 16),

              // Nome e informações do usuário
              Text(
                'Nome do Usuário',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Email institucional',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Telefone',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Departamento',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Cargo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Inicio da atividade',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Alterar a senha
              Text(
                'Alterar a senha',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),

              // Botão Salvar alterações
              Align(
                alignment: Alignment.center,  // Alinha o botão ao centro
                child: ElevatedButton(
                  onPressed: () {
                    _showConfirmationDialog();
                  },
                  child: const Text('Salvar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
