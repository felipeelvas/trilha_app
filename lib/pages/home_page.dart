import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var quantidadeCliques = 0;
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("chamando o método BUILD");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Meu App'),
          titleTextStyle: TextStyle(
                fontFamily: GoogleFonts.pacifico().fontFamily,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
      ),
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: Text(
                "Acções do Usuário",
                style: GoogleFonts.pacifico(fontSize: 30),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.orange,
                child: Text(
                  'Foi clicado $quantidadeCliques vezes',
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              color: Colors.purple,
              child: Text(
                'O número Gerado foi: $numeroGerado',
                style: GoogleFonts.acme(fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        color: Colors.red,
                        child: Text(
                          "Nome:",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: Text(
                          "Felipe Elvas",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        color: Colors.green,
                        child: Text(
                          "300",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            numeroGerado = GeradorNumeroAleatorioService().gerarNumeroAleatorio(numeroGerado);
            quantidadeCliques = GeradorNumeroAleatorioService().contarCliques(quantidadeCliques);
            debugPrint("Número gerado: $numeroGerado");
            debugPrint("Quantidade de cliques: $quantidadeCliques");
          });
        },
        child: const Icon(Icons.add_box, color: Colors.white),
      ),
    );
  }
}
