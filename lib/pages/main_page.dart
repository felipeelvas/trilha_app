
import 'package:flutter/material.dart';
import 'package:trilha_app/pages/dados_cadastrais.dart';
import 'package:trilha_app/pages/login_page.dart';
import 'package:trilha_app/pages/pagina_1.dart';
import 'package:trilha_app/pages/pagina_2.dart';
import 'package:trilha_app/pages/pagina_3.dart';

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
        drawer: Drawer(
          shadowColor: Colors.white,
          backgroundColor: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Menu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Divider(),
                SizedBox(height: 15),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text("Dados Cadastrais", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DadosCadastraisPage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 15),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text("Configurações", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(height: 15),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text("Termos de uso e Privacidade", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(height: 15),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text("Sair", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
                  onTap: () {
                    //retornar para a tela de login
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()) );
                    },
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  setState(() {
                  _paginaAtual = value;
                  print("Página atual: $value");
                  });
      },
                children: [
                  Pagina1Page(),
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
