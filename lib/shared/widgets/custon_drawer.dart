import 'package:flutter/material.dart';
import 'package:trilha_app/pages/configuracoes_page.dart';

import '../../pages/dados_cadastrais.dart';
import '../../pages/login_page.dart';
import '../../pages/numeros_aleatorios_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
        shadowColor: Colors.white,
        backgroundColor: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Menu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera),
                            title: Text("Camera"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.album),
                            title: Text("Galeria"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.remove_circle),
                            title: Text("Remover Foto"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.cancel),
                            title: Text("Cancelar"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),

                        ],
                      );
                    });
              },
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                currentAccountPicture: CircleAvatar(child: Image.network("https://ynaralira.github.io/Instagram-Dio/logo-dio.png")),
                accountName: Text("Nome do Usuário"),
                accountEmail: Text("email@email.com"),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.person, size: 30),
                            const SizedBox(width: 10),
                            Text("Dados Cadastrais", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        )),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DadosCadastraisPage()));
                    },
                  ),
                  const Divider(),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.settings, size: 30),
                            const SizedBox(width: 10),
                            Text("Configurações", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        )),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConfiguracoesPage()));
                    },
                  ),
                  const Divider(),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.numbers, size: 30),
                            const SizedBox(width: 10),
                            Text("Gerador de Números", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        )),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (bc) =>
                      NumerosAleatoriosPage()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.policy, size: 30),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              "Termos e Privacidade",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // permite scroll total
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (BuildContext bc) {
                          return DraggableScrollableSheet(
                            expand: false,
                            builder: (context, scrollController) {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: ListView(
                                  controller: scrollController,
                                  children: const [
                                    Text(
                                      "Termos de Uso e Política de Privacidade",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '''
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
                                                      ''',
                                      style: TextStyle(fontSize: 14, height: 1.5),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),

                  const Divider(),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app, size: 30),
                            const SizedBox(width: 10),
                            Text("Sair", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        )),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext bc) {
                            return AlertDialog(
                              alignment: Alignment.centerLeft,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white,
                              title: Text("Meu App", style: TextStyle(fontWeight: FontWeight.bold)),
                              content: Wrap(
                                children: [
                                  Text("Deseja realmente sair do aplicativo?", style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Text("Sair"))
                              ],
                            );
                          });
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        )
    );
  }
}