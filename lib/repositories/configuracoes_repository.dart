import 'package:hive/hive.dart';

import '../model/configuracoes_model.dart';

class ConfiguracoesRepository {
  static late Box _box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('box_configuracoes')) {
      _box = Hive.box('box_configuracoes');
    } else {
      _box = await Hive.openBox('box_configuracoes');
    }
    return ConfiguracoesRepository._criar();
  }

  void salvar(ConfiguracoesModel configuracoesModel ) {
    _box.put('configuracoesModel', {
      'nomeUsuario' : configuracoesModel.nomeUsuario,
      'altura' : configuracoesModel.altura,
      'receberPushNotifications' : configuracoesModel.receberPushNotifications,
      'temaEscuro' : configuracoesModel.temaEscuro,
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get('configuracoesModel');
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
      configuracoes['nomeUsuario'],
      configuracoes['altura'],
      configuracoes['receberPushNotifications'],
      configuracoes['temaEscuro'],
    );
  }
}