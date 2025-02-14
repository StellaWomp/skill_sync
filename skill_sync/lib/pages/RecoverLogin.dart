import 'package:flutter/material.dart';

class Recoverlogin extends StatefulWidget {
  const Recoverlogin({super.key});

  @override
  State<Recoverlogin> createState() => _Recoverlogin();
}

class _Recoverlogin extends State<Recoverlogin> {
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

  // Função para exibir o diálogo
  _showConfirmationDialog() {
    if (mounted) {
      showDialog(
        context: context,
        // Impede que o usuário feche o diálogo tocando fora dele
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(
            'Atenção',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
          icon: Icon(
            Icons.access_time,
            color: Colors.black,
          ),
          content: Container(
            child: Text(
              'Verifique seu e-mail.',
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
                if (mounted) {
                  Navigator.of(context).pop(); // Fecha o diálogo
                  Navigator.of(context).pushNamed('/'); // Redireciona para a tela de login
                }
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EABE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6EABE7),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recuperar Login',
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
              SizedBox(height: 25),
              // Inserir Email
              SizedBox(
                width: 290,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email institucional',
                    helperText: 'Obrigatório',
                    filled: true,
                    fillColor: Color(0xFFB4CBEC),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Inserir Departamento
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
              SizedBox(height: 25),
              // Botão Enviar
              ElevatedButton(
                onPressed: () {
                  // Exibindo o diálogo de confirmação
                  _showConfirmationDialog();
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
