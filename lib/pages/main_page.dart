
import 'package:flutter/material.dart';
import 'package:trilha_app/pages/dados_cadastrais.dart';
import 'package:trilha_app/pages/login_page.dart';
import 'package:trilha_app/pages/card_page.dart';
import 'package:trilha_app/pages/pagina_2.dart';
import 'package:trilha_app/pages/pagina_3.dart';

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
          backgroundColor: Colors.red,
            title: const Text("Main Page"),
            // titleTextStyle: TextStyle(
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.white,
            // ),
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
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
               controller.jumpToPage(value);
              },
                currentIndex: _paginaAtual , items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Pag1"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pag2"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Pag3"),
            ])
          ],
        ),
      ),
    );
  }
}
