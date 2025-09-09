import 'package:trilha_app/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {

    await Future.delayed(Duration(seconds: 4));

    return CardDetail(
      id: 1,
      title: "Card Page",
      url: "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    );
  }
}