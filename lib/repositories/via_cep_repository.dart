import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilha_app/model/cep_model.dart';

class ViaCEPRepository {
  Future<ViaCEPModel> consultarCEP(String cep) async {
    var response =
    await http
        .get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCEPModel.fromJson(json);
    }
    return ViaCEPModel();
  }
}