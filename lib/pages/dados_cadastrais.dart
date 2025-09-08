
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trilha_app/repositories/linguagens_repository.dart';
import 'package:trilha_app/repositories/nivel_repository.dart';
import 'package:trilha_app/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {

  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var nivelSelecionado = '';
  var linguagens = [];
  var linguagensSelecionadas = <String>[];
  double salarioPretendido = 0.0;
  int tempoDeExperiencia = 0;
  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.returnNiveis();
    linguagens = linguagensRepository.returnLiguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> retornaItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Dados')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: salvando? Center(child: CircularProgressIndicator()) : ListView(
          children: [
            TextLabel(texto: 'Nome',),
            TextField(
              controller: nomeController,
            ),
            TextLabel(texto: 'Data de Nascimento',),
            TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 5, 20),
                      lastDate: DateTime.now());
                  if (data != null) {
                    dataNascimentoController.text = data.toString();
                    dataNascimento = data;
                  }
                }),
            TextLabel(texto: 'Nível de experiência'),
            Column(
                children: niveis
                    .map((nivel) => RadioListTile(
                    dense: true,
                    title: Text(nivel.toString()),
                    selected: nivelSelecionado == nivel,
                    value: nivel,
                    groupValue: nivelSelecionado,
                    onChanged: (value) {
                      setState(() {
                        nivelSelecionado = value.toString();
                      });
                    }))
                    .toList()),
            TextLabel(texto: "Liguagens de programação favoritas"),
            Column(
                children:
                linguagens
                    .map((linguagem) => CheckboxListTile(
                    dense: true,
                    title: Text(linguagem),
                    value: linguagensSelecionadas.contains(linguagem),
                    onChanged: (value) {
                      if (value!) {
                        linguagensSelecionadas.add(linguagem);
                      } else {
                        linguagensSelecionadas.remove(linguagem);
                      }
                      setState(() {
                        linguagensSelecionadas = List.from(linguagensSelecionadas);
                      });
                    }))
                    .toList()),
            TextLabel(texto: 'Tempo de experiência (em anos): $tempoDeExperiencia',),
            DropdownButton(
              isExpanded: true,
                items: retornaItens(50),
                onChanged: (value) {
                setState(() {
                  tempoDeExperiencia = int.parse(value.toString());
                });
                }),
            TextLabel(texto: 'Pretensão salarial: R\$ ${salarioPretendido.round().toString()}',),
            Slider(
                min: 0,
                max: 10000,
                value: salarioPretendido,
                onChanged: (double value) {
                  setState(() {
                    salarioPretendido = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  setState(() {
                    salvando = false;
                   });

                  if (nomeController.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Nome deve ter pelo menos 3 caracteres')));
                    return;
                  }
                  if (dataNascimento == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Data de nascimento inválida')));
                    return;
                  }
                  if (nivelSelecionado.trim() == '') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Nível de experiência deve ser selecionado')));
                    return;
                  }
                  if (linguagensSelecionadas.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Selecione pelo menos uma linguagem')));
                    return;
                  }
                  if (tempoDeExperiencia == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Deve ter pelo menos 1 ano de experiência em uma linguagem')));
                    return;
                  }
                  if (salarioPretendido == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Informe sua pretensão salarial')));
                    return;
                  }

                  setState(() {
                    salvando = true;
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        content: Text('Dados salvos com sucesso'),
                        backgroundColor: Colors.green,
                        margin: EdgeInsets.all(8.0),
                        behavior: SnackBarBehavior.floating,
                        ));
                    setState(() {
                      salvando = false;
                    });
                    Navigator.pop(context);
                  });
                },
                child: Text('Salvar')
            ),
          ],
        ),
      ),
    );
  }
}
