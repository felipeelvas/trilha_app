import 'package:flutter/material.dart';

import '../shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          // leading: CircleAvatar(
          //   backgroundImage: AssetImage(AppImages.user2),
          // ),
          leading: Image.asset(AppImages.user2),
          title: Text('Usuário 2'),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Olá, tudo bem?'),
              Text('08:59'),
            ],
          ),
          // trailing: Icon(Icons.menu),
          trailing: PopupMenuButton(
            onSelected: (menu) {
              if (menu == 'edit') {
                print('Editar');
              } else if (menu == 'delete') {
                print('Excluir');
              } else if (menu == 'share') {
                print('Compartilhar');
              }
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: 'edit', child: Text('Editar')),
                PopupMenuItem<String>(value: 'delete', child: Text('Excluir')),
                PopupMenuItem<String>(value: 'share', child: Text('Compartilhar')),
              ];
            },
          ),
          // isThreeLine: true,
        ),
        Image.asset(
          AppImages.user1,
        ),
        Image.asset(
          AppImages.user2,
        ),
        Image.asset(
          AppImages.user3,
        ),
        Image.asset(
          AppImages.paisagem1,
        ),
        Image.asset(
          AppImages.paisagem2,
        ),
        Image.asset(
          AppImages.paisagem3,
        ),
      ],
    );
  }
}
