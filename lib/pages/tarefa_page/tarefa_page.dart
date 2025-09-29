import 'package:flutter/material.dart';

import '../../model/tarefa.dart';
import '../../repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var _tarefas = <Tarefa>[];
  var tarefaRepository = TarefaRepository();
  var descricaoController = TextEditingController();
  var apenasNaoConcluidas = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
      if (apenasNaoConcluidas) {
        _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
      }else {
        _tarefas = await tarefaRepository.listarTarefas();
      }

     setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
         showDialog(context: context, builder: (BuildContext bc) {
            return AlertDialog(
              title: const Text("Adicionar Tarefa"),
              content: TextField(
                controller: descricaoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descrição",
                ),
              ),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: const Text("Cancelar")),
                TextButton(onPressed: () async {
                  await tarefaRepository.adicionar(Tarefa(descricaoController.text, false));
                  Navigator.of(context).pop();
                  obterTarefas();
                },
                    child: const Text("Salvar")),
              ],
            );

         });
        },
        child: Icon(Icons.add),),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                      value: apenasNaoConcluidas,
                      onChanged: (bool? value) async {
                    apenasNaoConcluidas = value!;
                    obterTarefas();
                  }),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tarefas[index];
                return Dismissible(
                  onDismissed: (DismissDirection dismissDirection) async {
                    await tarefaRepository.remove(tarefa.id);
                    obterTarefas();
                  },
                  key: Key(tarefa.id),
                  child: ListTile(
                    title: Text(tarefa.descricao),
                    trailing: Switch(
                      value: tarefa.concluido,
                      onChanged: (bool? value) async {
                        await tarefaRepository.alterar(tarefa.id, value!);
                        obterTarefas();
                      },
                    ),
                  ),
                );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
