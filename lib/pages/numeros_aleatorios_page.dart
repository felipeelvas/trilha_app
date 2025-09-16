import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {

  int? numeroGerado;
  int? qtdCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QTD_CLIQUES = "qtd_cliques";
  late SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      qtdCliques = storage.getInt(CHAVE_QTD_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de Números Aleatorios',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
      ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(numeroGerado == null ? "Nenhum número gerado" : numeroGerado.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              ),
              Text(qtdCliques == null ? "Nenhum clique efetuado" :  qtdCliques.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () async {
            storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              qtdCliques = (qtdCliques ?? 0) + 1;
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
            storage.setInt(CHAVE_QTD_CLIQUES, qtdCliques!);
          },
          child: const Icon(Icons.add, size: 30),
        ),
    )
    );
  }
}
