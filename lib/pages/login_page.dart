
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 241, 243),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Icon(Icons.person, size: 150, color: Colors.blue,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded( flex: 2 ,child: Text("Informe seu email:")),
                    Expanded( flex: 3 ,child:Text("Email")),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded( flex: 2, child: Text("Informe a senha:")),
                    Expanded( flex: 3 ,child:Text("Senha")),
                  ],
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //   color: Colors.green,
              //   height: 50,
              //   alignment: Alignment.center,
              //   child: Text("Esqueci a senha"),
              // ),
              Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  color: Colors.green,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("Botão"),
                ),
              const SizedBox(height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                // color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: Text("Cadastro"),
              ),
          ],
          ),
        )
      ),
    );
  }
}
