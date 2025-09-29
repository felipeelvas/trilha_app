
import 'package:hive/hive.dart';
import 'package:trilha_app/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('tarefaHiveModel')) {
      _box = Hive.box('tarefaHiveModel');
    } else {
      _box = await Hive.openBox('tarefaHiveModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  alterar(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  excluir(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }

  List<TarefaHiveModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaHiveModel>()
          .where((tarefa) => !tarefa.concluido)
          .toList();
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }

}
