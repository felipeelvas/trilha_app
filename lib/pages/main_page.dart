
import 'package:flutter/material.dart';
import 'package:trilha_app/pages/dados_cadastrais/dados_cadastrais_shared.dart';
import 'package:trilha_app/pages/list_view_horizontal.dart';
import 'package:trilha_app/pages/login_page.dart';
import 'package:trilha_app/pages/card_page.dart';
import 'package:trilha_app/pages/image_assets.dart';
import 'package:trilha_app/pages/list_view.dart';
import 'package:trilha_app/pages/tarefa_page/tarefa_page.dart';

import '../shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int _paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Main Page"),
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                  _paginaAtual = value;
                  print("Página atual: $value");
                  });
      },
                children: [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TarefaPage()
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
               controller.jumpToPage(value);
              },
                currentIndex: _paginaAtual , items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Pag1"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pag2"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Pag3"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pag4"),
              BottomNavigationBarItem(icon: Icon(Icons.task_outlined), label: "Tarefas"),
            ])
          ],
        ),
      ),
    );
  }
}
