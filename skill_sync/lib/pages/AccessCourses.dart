import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Adicionando o GlobalKey ao Scaffold
      //Para resolver o problema de configurar o clique no icon Menu o chatgpt sugeriu usar key: _scaffoldKey,
      backgroundColor: const Color(0xFFCC4413),
      appBar: AppBar(
        backgroundColor: const Color(0xFF84B7EC),
        leading: Container(),
        title: Center(
          child: Text('Treinamento', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Homenaje'),
          ),
        ),
        //Para remover o icone do Drawer
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
                      children: [
                        Text('Menu Lateral', style: TextStyle(color: Colors.white)),
                        IconButton(
                          alignment: Alignment.topRight,
                          icon: Icon(Icons.notifications, color: Colors.white),
                          onPressed: () {
                            // Tocando no ícone de notificações
                            print('Notificações');
                          },
                        ),
                      ],
                    ),
                    Row(
                        children: [
                          Image.asset('imagens/fotoperfil.png',
                            width: 80,
                            height: 80,),
                          Text('Nome do usuário'),
                          Text('Departamento: '),
                          Text('Cargo: '),
                        ],
                    )
                  ],
                ),
              )
            ),
            //Onde vai informação do treinamento/perfil
            Container(
              child: Row(
                //icone

                //descrição
              ),
            ),

            //Onde vai informação do desempenho
            Container(
              child: Row(
                //icone

                //descrição
              ),
            ),

            //Onde vai informação das Atividades
            Container(
              child: Row(
                //icone

                //descrição
              ),
            ),

            //Onde vai informação dos desafios
            Container(
              child: Row(
                //imagem
                children: [
                  Image.asset('imagens/desafio.png',
                    width: 80,
                    height: 80,),
                ],

              ),
            ),

            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
