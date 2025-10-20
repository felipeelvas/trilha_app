import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/cep_model.dart';
import '../repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController();
  bool loading = false;
  var viaCEPModel = ViaCEPModel();
  var viaCEPRepository = ViaCEPRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Consulta CEP",
              style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 8),
              TextField(
                controller: cepController,
              // maxLength: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CEP",
                hintText: "Digite o CEP com 8 dígitos",
                suffixIcon: Icon(Icons.search),
              ),
                keyboardType: TextInputType.number,
                onChanged: (String value) async {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                  }
                  viaCEPModel = await viaCEPRepository.consultarCEP(cep);
                  setState(() {
                    loading = false;
                  });
                },
              ),
              SizedBox(height: 8),
              Text("Endereço",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Text(viaCEPModel.logradouro ?? ""),
              SizedBox(height: 8),
              Text("Cidade",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Text(viaCEPModel.localidade ?? ""),
              SizedBox(height: 8),
              Text("Estado",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Text(viaCEPModel.uf ?? ""),
              // Visibility(visible: loading, child:  CircularProgressIndicator()),
              if(loading) CircularProgressIndicator(),
            ],

          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{}),
      ),
    );
  }
}