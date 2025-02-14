import 'package:flutter/material.dart';

class RegisterLogin extends StatefulWidget {
  const RegisterLogin({super.key});

  @override
  State<RegisterLogin> createState() => _RegisterLogin();
}

class _RegisterLogin extends State<RegisterLogin> {

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

  //Função para exibir diálogo
  _showConfirmationDialog(){
    showDialog(context: context,
        // Impede que o usuário feche o diálogo tocando fora dele
        barrierDismissible: false,
      builder: (_) => AlertDialog(
          title: Text(
            'Aguarde Liberação',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
          ),
          ),
          icon: Icon(Icons.access_time, color: Colors.black,),
          content: Container(
          child: Text(
            'Aguarde o responsável do seu setor autorizar seu acesso.',
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
        Navigator.of(context).pushNamed('/');
      },
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cadastro',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje'),
                  ),
                  SizedBox(height: 15),
                  //Inserir nome
                  SizedBox(
                    width: 290,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      hintText: 'Nome Completo',
                      helperText: 'Obrigatório',
                      filled: true,
                      fillColor: Color(0xFFB4CBEC)
                    ),
                  ),
                  ),
                  SizedBox(height: 10),
                  //Inserir Email
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
                          fillColor: Color(0xFFB4CBEC)
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Inserir Senha
                  SizedBox(
                    width: 290,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          hintText: 'Password',
                          helperText: 'Obrigatório',
                          filled: true,
                          fillColor: Color(0xFFB4CBEC)
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
                  //Inserir Cargo
                  SizedBox(
                    width: 290,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.work),
                          border: OutlineInputBorder(),
                          labelText: 'Função',
                          hintText: 'Função',
                          helperText: 'Obrigatório',
                          filled: true,
                          fillColor: Color(0xFFB4CBEC)
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  //Botão Cadastrar
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog();
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            )
        )
    );
  }
}
