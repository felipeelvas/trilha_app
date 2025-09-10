
import 'dart:math';

class GeradorNumeroAleatorioService {
  int gerarNumeroAleatorio(int numeroMaximo) {
    Random numeroGerado = Random();
    if (numeroMaximo <= 0) {
      return numeroGerado.nextInt(100) + 1; // gera número entre 1 e 100 por padrão
    }
    return numeroGerado.nextInt(numeroMaximo) + 1; // garante que nunca retorna 0
  }

  int contarCliques(
      int quantidadeCliques) {
    return quantidadeCliques + 1;
  }
}