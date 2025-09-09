import 'package:flutter/material.dart';
import 'package:trilha_app/pages/card_detail_page.dart';
import 'package:trilha_app/repositories/card_detail_repository.dart';

import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null ? LinearProgressIndicator() : InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardDetailPage(
                    cardDetail: cardDetail!,)));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                elevation: 8,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            cardDetail!.url,
                            height: 50,
                          ),
                          Text(cardDetail!.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        cardDetail!.text,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Saiba mais",
                            style: TextStyle(decoration: TextDecoration.underline),) ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
