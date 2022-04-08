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
  
   factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      bankName: json['bankName'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      cardHolderName: json['cardHolderName'],
      cvvCode: json['cvvCode'],
      cardType: json['cardType']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNumber'] = this.cardNumber;
    data['expiryDate'] = this.expiryDate;
    data['cardHolderName'] = this.cardHolderName;
    data['cvvCode'] = this.cvvCode;
    return data;
  }
}

