import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/app_storage_service.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  AppStorageService storage = AppStorageService();

  var nomeUsuarioController = TextEditingController();
  var alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberPushNotifications = false;
  bool temaEscuro = false;


  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      carregarConfiguracoes();
    }

    void carregarConfiguracoes() async {
      nomeUsuario = await storage.getConfiguracoesNomeUsuario();
      altura = await storage.getConfiguracoesAltura();
      receberPushNotifications = await storage.getConfiguracoesReceberPushNotifications();
      temaEscuro = await storage.getConfiguracoesTemaEscuro();
      nomeUsuarioController.text = nomeUsuario ?? "";
      alturaController.text = (altura != null) ? altura.toString() : "";
      setState(() {});
    }

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
            onChanged: (bool value) {
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
                foregroundColor:  Theme.of(context).colorScheme.surface,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                await storage.setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                try {
                  await storage.setConfiguracoesAltura(
                  double.parse(alturaController.text));
                } catch (e) {
                  showDialog(context: context, builder: (_) {
                    return AlertDialog(
                      title: Text("Erro" ),
                      content: Text("Valor inválido para altura. Por favor, insira um número válido." ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  });
                  return;
                  // await storage.setDouble(CHAVE_ALTURA, 0.0);
                }
                await storage.setConfiguracoesReceberPushNotifications(receberPushNotifications);
                await storage.setConfiguracoesTemaEscuro(temaEscuro);
                Navigator.pop(context);
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
