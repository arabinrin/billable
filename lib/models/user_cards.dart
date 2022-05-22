import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
   enum Type{
    masterCard,visa,verve
  }

class UserCard {
  String cardNumber;
  String cardName;
  String expire;
  Type cardType;
  String cvv;
  UserCard({
    required this.cardNumber,
    required this.cardName,
    required this.expire,
    required this.cardType,
    required this.cvv,
  });
}

class UserCards with ChangeNotifier {
  List<UserCard> list = [];

  void addCard(UserCard card) {
    final newCard = UserCard(
      cardNumber: card.cardNumber,
      cardName: card.cardName,
      expire: card.expire,
      cardType: card.cardType,
      cvv: card.cvv,
    );
    list.add(newCard);
    notifyListeners();
  }
}
