// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

import '../models/card_model.dart';

class CardProvider extends ChangeNotifier {
  List<CardModel> _cardModelList = [
    CardModel(
        bankName: 'GTBank',
        cardNumber: '1234567890123456',
        expiryDate: '12/20',
        cardHolderName: 'John Doe',
        cvvCode: '123',
        cardType: 'master'),
    
  ];

//add credit card details to list
  void addCardModel(CardModel cardModel) {
    _cardModelList.add(cardModel);
    print(cardModel.cardNumber);
    notifyListeners();
  }

//remove credit card details from list
  void deleteCardModel(CardModel cardModel) {
    _cardModelList.remove(cardModel);
    notifyListeners();
  }

//update credit card details in list
  void updateCardModel(CardModel cardModel) {
    notifyListeners();
  }

//get list of credit card details
  List<CardModel> get cardModelList => _cardModelList;
}
