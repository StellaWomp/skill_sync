import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_sync/pages/LoginPage.dart';

// Função para exibir o diálogo de confirmação
void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Permite fechar tocando fora
    builder: (_) => AlertDialog(
      icon: Icon(
        Icons.logout,
        color: Colors.black,
        size: 45,
      ),
      content: Container(
        child: Text(
          'Deseja sair?',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Homenaje',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o diálogo
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) =>
              false, // Remove todas as rotas anteriores
            );
          },
          child: Text(
            'SAIR',
            style: TextStyle(
              fontSize: 20,
              color: Colors.redAccent, // Cor do botão
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

// Buscar as escolas na API
Future<List<String>> buscarEscolas(String query) async {
  final response =
  await http.get(Uri.parse('https://sua-api.com/escolas?nome=$query'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    // API buscando nome
    return data.map((item) => item['nome'].toString()).toList();
  } else {
    throw Exception('Erro ao carregar dados');
  }
}

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _Support();
}

class _Support extends State<Support> {
  TextEditingController _controller = TextEditingController();  // Controller para o TextField
  List<String> escolas = [];  // Lista para armazenar os nomes das escolas
  bool isLoading = false;  // Flag para mostrar o loading enquanto busca dados

  // Função para chamar a API e buscar escolas
  void fetchEscolas(String query) async {
    setState(() {
      isLoading = true;  // Ativa o carregamento
    });

    try {
      List<String> fetchedEscolas = await buscarEscolas(query);
      setState(() {
        escolas = fetchedEscolas;  // Atualiza a lista de escolas com os dados da API
        isLoading = false;  // Desativa o carregamento
      });
    } catch (e) {
      setState(() {
        isLoading = false;  // Desativa o carregamento em caso de erro
      });
      print("Erro ao carregar as escolas: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEscolas('');  // Inicializa a busca sem filtro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCC4413),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE031),
        title: Center(
          child: Text(
            'Suporte',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined, color: Colors.black, size: 35),
            onPressed: () {
              _showConfirmationDialog(context);  // Exibe o diálogo de confirmação
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),

              // Filtro de pesquisa de escolas
              Column(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Filtrar escolas',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (query) {
                        fetchEscolas(query);  // Chama a função de busca sempre que o texto muda
                      },
                    ),
                  ),
                  // Lista com as escolas
                  Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())  // Exibe o loading enquanto busca
                        : ListView.builder(
                      itemCount: escolas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            escolas[index],  // Exibe o nome da escola
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),



              SizedBox(height: 10),
              // Lista dos kits relacionados a escola
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 25),
              // Botão "Filtrar"
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/second');
                },
                child: const Text('Filtrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
