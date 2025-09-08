import 'package:flutter/material.dart';

class Pagina3Page extends StatefulWidget {
  const Pagina3Page({super.key});

  @override
  State<Pagina3Page> createState() => _Pagina3PageState();
}

class _Pagina3PageState extends State<Pagina3Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: const Center(
        child: Text(
          "Página 3",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
