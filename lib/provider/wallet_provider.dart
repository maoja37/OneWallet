
import 'package:flutter/cupertino.dart';

import '../models/card_model.dart';

class CardProvider extends ChangeNotifier{
//create list of credit card details
  List<CardModel> cardModelList = [];

//add credit card details to list
  void addCardModel(CardModel cardModel){
    cardModelList.add(cardModel);
    notifyListeners();
  }

//remove credit card details from list
  void removeCardModel(CardModel cardModel){
    cardModelList.remove(cardModel);
    notifyListeners();
  }

//update credit card details in list
  void updateCardModel(CardModel cardModel){
    notifyListeners();
  }

//get list of credit card details
  List<CardModel> getCardModelList(){
    return cardModelList;
  }
}

