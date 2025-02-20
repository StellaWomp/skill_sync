import 'package:flutter/material.dart';

class KitsPage extends StatefulWidget {
  //final String escola;
  //final List<String> kits;

  // Construtor para receber os dados
  const KitsPage({Key? key, required this.escola, required this.kits}) : super(key: key);


  @override
  State<KitsPage> createState() => _KitsPageState();
}

class _KitsPageState extends State<KitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCC4413),
      appBar: AppBar(
        backgroundColor: const Color(0xFF74CF1E),
        title: const Center(
          child: Text(
            'Kits',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Aqui você acessa o nome da escola que foi passado para a página
            Text(
              'Escola: ${widget.escola}', //  Agora mostra o nome da escola
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Homenaje',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Equipamentos disponíveis:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Homenaje',
              ),
            ),
            // Exibe os itens do kit com ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: widget.kits.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: const Color(0xFF74CF1E),
                    child: ListTile(
                      title: Text(
                        widget.kits[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                      onTap: () {
                        print("Clicou no kit: ${widget.kits[index]}");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
