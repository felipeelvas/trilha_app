import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  var nomeUsuarioController = TextEditingController();
  var alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberPushNotifications = false;
  bool temaEscuro = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Configurações',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
      ),
      ),
      body: Container(child:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nomeUsuarioController,
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  nomeUsuario = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: alturaController,
              decoration: InputDecoration(
                labelText: 'Altura (metros)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  altura = double.tryParse(value);
                });
              },
            ),
          ),
          SwitchListTile(
            title: Text('Receber Notificações Push'),
            value: receberPushNotifications,
            onChanged: (value) {
              setState(() {
                receberPushNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Tema Escuro'),
            value: temaEscuro,
            onChanged: (value) {
              setState(() {
                temaEscuro = value;
              });
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor:  Theme.of(context).colorScheme.onSecondary,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Configurações salvas!', style: TextStyle(fontSize: 16, backgroundColor: Colors.green[700], color: Theme.of(context).colorScheme.onPrimary)),),
                );
              },
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Salvar Configurações', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Icon(Icons.save, size: 24),
                  ]
              ),
            ),
          ),
        ],
      ),),

    )
    );
  }
}
