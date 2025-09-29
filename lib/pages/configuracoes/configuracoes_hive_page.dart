import 'package:flutter/material.dart';
import 'package:trilha_app/model/configuracoes_model.dart';
import 'package:trilha_app/repositories/configuracoes_repository.dart';


class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {

  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarConfiguracoes();
  }

  void carregarConfiguracoes() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();

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
                  configuracoesModel.nomeUsuario = value;
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
                  configuracoesModel.altura = double.tryParse(value) ?? 0.0;
                });
              },
            ),
          ),
          SwitchListTile(
            title: Text('Receber Notificações Push'),
            value: configuracoesModel.receberPushNotifications,
            onChanged: (value) {
              setState(() {
                configuracoesModel.receberPushNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Tema Escuro'),
            value: configuracoesModel.temaEscuro,
            onChanged: (bool value) {
              setState(() {
                configuracoesModel.temaEscuro = value;
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
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                  configuracoesModel.altura =
                      double.parse(alturaController.text);
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
                }
                configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                configuracoesRepository.salvar(configuracoesModel);
                Navigator.pop(context);
              },
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Salvar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
