// lib/legal/terms_privacy.dart
import 'package:flutter/material.dart';

/// =====================
/// Textos (PT-BR)
/// =====================

class LegalTextsPt {
  /// Versão completa: Termos de Uso + Política de Privacidade (LGPD)
  static const String termosEPrivacidade = '''
# Termos de Uso e Política de Privacidade

## 1. Introdução
Este aplicativo ("TODO: Nome do App") respeita sua privacidade e protege seus dados pessoais conforme a Lei Geral de Proteção de Dados (Lei nº 13.709/2018 – LGPD). Ao utilizar o app, você concorda com estes termos.

## 2. Coleta de Dados
Podemos coletar:
• Identificação: nome, e-mail, telefone;
• Uso do app: interações, preferências, eventos de erro;
• Dispositivo: modelo, SO, versão do app, identificadores limitados (quando estritamente necessários).

## 3. Bases Legais e Finalidades
Tratamos dados com base em:
• Execução do contrato/serviço: entregar funcionalidades essenciais;
• Legítimo interesse: melhorar experiência, segurança e desempenho;
• Cumprimento legal/regulatório.
Finalidades incluem: autenticação, suporte, métricas, prevenção a fraudes e melhoria contínua.

## 4. Compartilhamento
Não vendemos seus dados. Compartilhamos apenas com:
• Prestadores essenciais (hospedagem, analytics estritamente necessários);
• Requisições legais/autoridades;
sempre limitando ao mínimo necessário.

## 5. Direitos do Titular (LGPD)
Você pode:
• Acessar, corrigir, atualizar e apagar dados;
• Revogar consentimentos;
• Solicitar portabilidade e informações sobre uso e compartilhamentos;
• Opor-se a tratamentos em casos previstos.
Contato: TODO: seu-email@dominio.com

## 6. Segurança
Empregamos medidas técnicas e administrativas para proteger os dados contra acesso não autorizado, perda, alteração ou destruição.

## 7. Retenção
Mantemos dados somente pelo tempo necessário às finalidades, prazos legais ou defesa de direitos.

## 8. Crianças e Adolescentes
Se o app for utilizado por menores, o tratamento observará as regras de consentimento específico do responsável, quando aplicável.

## 9. Alterações desta Política
Podemos atualizar este documento. Notificaremos mudanças relevantes pelo app ou canais adequados.

## 10. Contato do Controlador e DPO
Controlador: TODO: Sua Empresa/Pessoa Jurídica
E-mail do DPO/Encarregado: TODO: dpo@dominio.com
''';

//   /// Versão enxuta (para loja de apps)
//   static const String politicaEnxuta = '''
// Política de Privacidade – LGPD
//
// Coletamos apenas dados necessários (ex.: nome, e-mail, uso do app) para operar e melhorar o "TODO: Nome do App". Não vendemos dados. Compartilhamos apenas com prestadores essenciais ou por exigência legal. Você pode acessar, corrigir, excluir seus dados e revogar consentimentos. Contato: TODO: seu-email@dominio.com
// ''';
// }

/// =====================
/// Tela para exibir textos (sem dependências externas)
/// =====================

// class LegalTextScreen extends StatelessWidget {
//   final String title;
//   final String content;
//
//   const LegalTextScreen({
//     super.key,
//     required this.title,
//     required this.content,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final lines = content.split('\n');
//
//     // separa cabeçalhos simples por marcador (#) pra dar destaque visual
//     Text _lineToWidget(String line) {
//       if (line.startsWith('### ')) {
//         return Text(
//           line.replaceFirst('### ', ''),
//           style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
//         );
//       } else if (line.startsWith('## ')) {
//         return Text(
//           line.replaceFirst('## ', ''),
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
//         );
//       } else if (line.startsWith('# ')) {
//         return Text(
//           line.replaceFirst('# ', ''),
//           style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
//         );
//       } else {
//         return Text(
//           line,
//           style: Theme.of(context).textTheme.bodyMedium,
//         );
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: ListView.separated(
//             itemCount: lines.length,
//             itemBuilder: (_, i) => SelectableText.rich(
//               _lineToWidget(lines[i]).textSpan ?? TextSpan(text: lines[i]),
//             ),
//             separatorBuilder: (_, __) => const SizedBox(height: 8),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// =====================
/// Dialog rápido (modal)
/// =====================

Future<void> showLegalDialog(
    BuildContext context, {
      required String title,
      required String content,
    }) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: SelectableText(content),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    ),
  );
}}
