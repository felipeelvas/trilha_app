
class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0.0;
  bool _receberPushNotifications = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0.0;
    _receberPushNotifications = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberPushNotifications, this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;

  set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  bool get receberPushNotifications => _receberPushNotifications;

  set receberPushNotifications(bool receberPushNotifications) {
    _receberPushNotifications = receberPushNotifications;
  }

  bool get temaEscuro => _temaEscuro;

  set temaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }

}