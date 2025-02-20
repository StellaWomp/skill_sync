import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_sync/pages/LoginPage.dart';
import 'package:skill_sync/pages/EquipmentPage.dart';

// Função para exibir o diálogo de confirmação
void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => AlertDialog(
      icon: Icon(
        Icons.logout,
        color: Colors.black,
        size: 45,
      ),
      content: Text(
        'Deseja sair?',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Homenaje',
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Text(
            'SAIR',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFB4CBEC),
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
  final response = await http.get(Uri.parse('https://sua-api.com/escolas?nome=$query'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
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
  TextEditingController _controller = TextEditingController();
  List<String> escolas = [];
  bool isLoading = false;

  void fetchEscolas(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      List<String> fetchedEscolas = await buscarEscolas(query);
      setState(() {
        escolas = fetchedEscolas;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Erro ao carregar as escolas: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEscolas('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EABE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF84B7EC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o título
          children: [
            // A imagem na lateral esquerda
            Image.asset(
              'imagens/nbn.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            // Centralizando o título
            Expanded(
              child: Center(
                child: Text(
                  'Suporte',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Homenaje',
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined, color: Colors.black, size: 35),
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text("Escolas", style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Homenaje',
                )),
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
                      fetchEscolas(query);
                    },
                  ),
                ),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: escolas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          escolas[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Text("Kits relacionados", style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Homenaje',
                )),
                SizedBox(height: 10),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/seventh');
                  },
                  child: const Text('Equipamentos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
