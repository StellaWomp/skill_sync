import 'package:flutter/material.dart';
import 'package:skill_sync/main.dart';
import 'package:skill_sync/pages/ReportProblem.dart';
import 'package:skill_sync/pages/Profile.dart';
import 'package:skill_sync/pages/EvidencePage.dart';
import 'package:skill_sync/pages/EquipmentPage.dart';

import 'LoginPage.dart';

class AccessCourses extends StatefulWidget {
  const AccessCourses({super.key});

  @override
  State<AccessCourses> createState() => _AccessCourses();
}

class _AccessCourses extends State<AccessCourses> {
  // Criação de um GlobalKey para o Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> imagens = [
    'imagens/django.png',
    'imagens/js.png',
    'imagens/flutter.png',
    'imagens/html.png',
    'imagens/kotlin.png',
    'imagens/postegre.png',
    'imagens/python.png',
  ];

  int _selectedIndex = 1;

  // Quando clicar nos ícones no final da tela
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pop(context); // Voltar para a tela anterior
        break;
      case 1:
        Navigator.pushReplacementNamed(
            context, '/second'); // Voltar para a tela de início
        break;
      case 2:
      // Abrir a sidebar (Drawer) usando o GlobalKey
        _scaffoldKey.currentState?.openDrawer();
        break;
      default:
        break;
    }
  }

  // Função para exibir o diálogo
  _showConfirmationDialog() {
    if (mounted) {
      showDialog(
        context: context,
        // Impede (false) ou Permite (true) que o usuário feche o diálogo tocando fora dele
        barrierDismissible: true,
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
                if (mounted) {
                  Navigator.of(context).pop(); // Fecha o diálogo
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false, // Remove todas as rotas anteriores
                  );
                }
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Adicionando o GlobalKey ao Scaffold
      backgroundColor: const Color(0xFFCC4413),
      appBar: AppBar(
        backgroundColor: const Color(0xFF84B7EC),
        leading: Container(),
        title: Center(
          child: Text(
            'Treinamento',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje',
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              // Lista com os temas dos treinamentos
              Container(
                height: 150, // Definir uma altura fixa
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagens.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue, // Cor de fundo
                          borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                        ),
                        child: Image.asset(
                          imagens[index], // Carregar a imagem da lista
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          fit: BoxFit.fill, // A imagem vai se ajustar
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Outros widgets
            ],
          ),
        ),
      ),
      // BottomNavigationBar para navegação
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Define o item selecionado
        onTap: _onItemTapped, // Adiciona a ação ao clicar no ícone
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_left_outlined),
            label: "Voltar", // Botão de Voltar
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início", // Botão de Ir para a tela inicial
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu", // Botão para abrir o Menu
          ),
        ],
      ),
      // Definir o menu lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.topLeft,
                          icon: Icon(Icons.notifications, color: Colors.yellow),
                          onPressed: () {
                            // Tocando no ícone de notificações
                            print('Notificações');
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Imagem de perfil
                        Image.asset(
                          'imagens/fotoperfil.png',
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 5),
                        // Coluna de textos
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os textos na altura da imagem
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                          children: [
                            Text(
                              'Nome do usuário',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Departamento',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Cargo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        // Coluna de ícones
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end, // ícones na parte inferior
                          crossAxisAlignment: CrossAxisAlignment.start, // ícones à esquerda
                          children: [
                            Icon(Icons.person),
                            Icon(Icons.work),
                            Icon(Icons.handyman_outlined),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Onde vai a informação do treinamento/perfil
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // ícone editar perfil
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/fifth');
                          },
                          child: Image.asset(
                            'imagens/editarperfil.png',
                            width: 140,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                    // descrição
                    Text(
                      'Pagina Evidencias',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'MarkaziText-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            // Onde vai a informação do desempenho
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100], // Cor de fundo
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), // Bordas arredondadas
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centraliza os filhos na horizontal
                  children: [
                    // Ícone
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sixth');
                      },
                      child: Image.asset(
                        'imagens/grafico.png',
                        width: 140,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 8), // Espaço entre o ícone e o texto
                    Text(
                      'Pagina Equipamento',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'MarkaziText-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            // Onde vai a informação das Atividades
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ícone teste
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tenth');
                      },
                      child: Image.asset(
                        'imagens/teste_atividades.png',
                        width: 140,
                        height: 80,
                      ),
                    ),
                    Text(
                      'Suporte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'MarkaziText-Bold',
                      ),
                    ),
                  ],
                ),
              ),
              ),

            SizedBox(height: 5),
            // Onde vai a informação dos desafios
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100], // Cor de fundo
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), // Bordas arredondadas
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ícone teste
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tenth'); //temporariamente a página do suporte
                      },
                      child: Image.asset(
                        'imagens/desafio.png',
                        width: 140,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            // Três ícones no fim do menu
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Escrever sugestões
                  InkWell(
                    onTap: () {
                      // Ação clicar na imagem
                      print('Imagem clicada!');
                      Navigator.of(context).pushNamed('/sixth');
                    },
                    child: Image.asset(
                      'imagens/sugestoes.png',
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 4),

                  // Reportar Problema
                  InkWell(
                    onTap: () {
                      // Ação a ser realizada ao clicar na imagem
                      print('Imagem clicada!');
                      Navigator.of(context).pushNamed('/fifth');
                    },
                    child: Image.asset(
                      'imagens/pesquisaproblema.png',
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Centraliza o ícone e o texto
                      children: [
                        Icon(Icons.login_outlined, color: Colors.black, size: 45),
                        SizedBox(width: 8), // Espaço entre o ícone e o texto
                        Text(
                          'SAIR',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Estilo do texto
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Exibindo o diálogo de confirmação
                      _showConfirmationDialog();
                    },
                  ),
                ],
              ),
            ),
    ],
    )
    )
    );
  }
}
