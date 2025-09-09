
import 'package:flutter/material.dart';
import 'package:trilha_app/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(cardDetail.title),
          // ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Row(
                    children: [
                      Image.network(
                        cardDetail.url,
                        height: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(cardDetail.title, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      cardDetail.text,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
