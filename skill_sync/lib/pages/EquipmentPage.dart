import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/Support.dart';
import 'package:image_picker/image_picker.dart';


class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPage();
}

class _EquipmentPage extends State<EquipmentPage> {

  //função para:
  //Quando não tiver evidencias add aparecer ADICIONAR EVIDÊNCIAS
  //Quando as evidencias já estiverem add aparecer EDITAR ou SALVAR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EABE7),
      appBar: AppBar(
        backgroundColor: Color(0xFFB4CBEC),
        title: const Text(
          'Equipamento',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Homenaje',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Equipamento: ', //  Agora mostra o nome da escola
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                 const SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    const Text(
                       'Modelo: ',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Homenaje',
                       ),
                     ),
                   ],
                 ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Serial Key: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Marca: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Fornecedor: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Nota Fiscal: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Status: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Evidências: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Homenaje',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Aparecer as evidencias adicionadas


                const SizedBox(height: 15),
                // Botão para direcionar a página de evidencia e lá tirar as fotos
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                       Navigator.of(context).pushReplacementNamed('/fifth');
                    },
                      child: const Text('Editar'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/tenth');
                     },
                      child: const Text('Salvar'),
                     ),


                ],

            ),
            ]
          ),
        ),
      ),
    ),
    );
  }
}