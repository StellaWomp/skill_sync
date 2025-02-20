import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EvidencePage extends StatefulWidget {
  const EvidencePage({super.key});

  @override
  State<EvidencePage> createState() => _EvidencePage();
}

class _EvidencePage extends State<EvidencePage> {
  // Lista de faces disponíveis
  final List<String> face = [
    'Frente',
    'Verso',
    'Lado Direito',
    'Lado Esquerdo',
    'De cima',
  ];

  // Lista para armazenar as faces selecionadas
  List<String> facesSelecionadas = [];
  String? faceSelecionada;

  // Lista para armazenar as imagens associadas a cada face
  Map<String, List<File>> fotosAssociadas = {};

  final ImagePicker _picker = ImagePicker();

  // Função para adicionar uma face à lista de selecionadas
  void adicionarFace() {
    if (faceSelecionada != null && !facesSelecionadas.contains(faceSelecionada)) {
      setState(() {
        facesSelecionadas.add(faceSelecionada!);
      });
    }
  }

  // Função para tirar uma foto com a câmera
  Future<void> tirarFoto() async {
    final XFile? foto = await _picker.pickImage(source: ImageSource.camera);

    if (foto != null) {
      setState(() {
        // Adiciona a foto à lista de imagens associadas à face selecionada
        if (fotosAssociadas.containsKey(faceSelecionada)) {
          fotosAssociadas[faceSelecionada]!.add(File(foto.path));
        } else {
          fotosAssociadas[faceSelecionada!] = [File(foto.path)];
        }
      });
    }
  }

  // Função para adicionar mais imagens
  Future<void> adicionarImagem() async {
    if (faceSelecionada != null) {
      final XFile? foto = await _picker.pickImage(source: ImageSource.gallery);

      if (foto != null) {
        setState(() {
          // Adiciona a foto à lista de imagens associadas à face selecionada
          if (fotosAssociadas.containsKey(faceSelecionada)) {
            fotosAssociadas[faceSelecionada]!.add(File(foto.path));
          } else {
            fotosAssociadas[faceSelecionada!] = [File(foto.path)];
          }
        });
      }
    }
  }

  // Função para salvar as evidências
  void salvarEvidencias() {
    //salvar no banco
    print("Evidências salvas:");
    fotosAssociadas.forEach((key, value) {
      print('Face: $key, Imagens: ${value.map((e) => e.path).join(', ')}');
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Evidências salvas com sucesso!'),
    ));
    Navigator.of(context).pushReplacementNamed('/sixth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EABE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF84B7EC),
        title: Center(
          child: Text(
            'Evidências',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicionar Evidência',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Homenaje',
                  ),
                ),
                SizedBox(height: 20),

                // Inserir face
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Face',
                      helperText: 'Obrigatório',
                      filled: true,
                      fillColor: Color(0xFFB4CBEC),
                    ),
                    value: faceSelecionada,
                    onChanged: (String? novoValor) {
                      setState(() {
                        faceSelecionada = novoValor;
                      });
                    },
                    items: face.map((String face) {
                      return DropdownMenuItem<String>(
                        value: face,
                        child: Text(face),
                      );
                    }).toList(),
                  ),
                ),

                // Botão para adicionar a face selecionada
                ElevatedButton(
                  onPressed: () {
                    if (faceSelecionada != null) {
                      adicionarFace();
                    }
                  },
                  child: const Text('Adicionar Face'),
                ),

                // Exibir faces selecionadas
                const SizedBox(height: 20),
                const Text(
                  'Faces selecionadas:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Homenaje',
                  ),
                ),
                const SizedBox(height: 10),
                facesSelecionadas.isEmpty
                    ? const Text('Nenhuma face selecionada')
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: facesSelecionadas.length,
                  itemBuilder: (context, index) {
                    String face = facesSelecionadas[index];
                    return ListTile(
                      title: Text(face),
                      subtitle: fotosAssociadas.containsKey(face)
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: fotosAssociadas[face]!
                            .map((foto) => Image.file(foto))
                            .toList(),
                      )
                          : const Text('Nenhuma foto associada'),
                    );
                  },
                ),

                // Botões para tirar foto
                const SizedBox(height: 20),
                if (faceSelecionada != null && fotosAssociadas[faceSelecionada!] == null) ...[
                  ElevatedButton(
                    onPressed: tirarFoto,
                    child: const Text('Tirar Foto com a Câmera'),
                  ),
                ],

                // Botão para adicionar mais imagens
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: adicionarImagem,
                      child: const Text(' + Imagens'),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Botão para salvar as evidências
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: salvarEvidencias,
                      child: const Text('Salvar Evidências'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
