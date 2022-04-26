class CardModel{
  String bankName;
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  String? cardType;

  CardModel({
    required this.bankName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    this.cardType
  });
  

}

