
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Main Page")),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Divider(),
                SizedBox(height: 15),
                InkWell(child: Text("Dados Cadastrais", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                onTap: () {

                },),
                Divider(),
                Text("Configurações", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Divider(),
                Text("Termos de uso e privacidade", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Divider(),
              ],),
          ),),
      ),
    );
  }
}
