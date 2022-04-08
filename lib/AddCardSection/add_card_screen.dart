// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_wallet/models/card_model.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:one_wallet/widgets/dummy_card_widget.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final bankNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final cvvController = TextEditingController();

  String bankName = '';
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 66,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: Color(0xff292D32),
                    size: 18,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                Text(
                  'Add Card',
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0B0B0B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            DummyCardWidget(
              cardModel: CardModel(
                  cardNumber: 'XXXXXXXXXXXXXXXX',
                  bankName: '----',
                  cardHolderName: '----',
                  expiryDate: '----',
                  cvvCode: '---',
                  cardType: 'master'),
            ),
            SizedBox(height: 36),
            TextFormField(
              controller: bankNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Bank name',
                  hintStyle: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  fillColor: Color(0xffFAFBFF),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: cardHolderNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Card Holder name',
                  hintStyle: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  fillColor: Color(0xffFAFBFF),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: cardNumberController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Card Number',
                  hintStyle: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  fillColor: Color(0xffFAFBFF),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: cvvController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'CVV',
                  hintStyle: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  fillColor: Color(0xffFAFBFF),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: expiryDateController,
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'Expiry Date',
                  hintStyle: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  fillColor: Color(0xffFAFBFF),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 36,
            ),
            MaterialButton(
              onPressed: () {
                // if (_formKey.currentState.validate()) {
                //   _formKey.currentState.save();
                //   Navigator.of(context).pop();
                // }
                bankName = bankNameController.text;
                cardHolderName = cardHolderNameController.text;
                cardNumber = cardNumberController.text;
                cvvCode = cvvController.text;
                expiryDate = expiryDateController.text;

                provider.addCardModel(CardModel(
                    bankName: bankName,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode));

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.asset('assets/dialog_illustration.png',
                                width: 109, height: 109),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Welldone!',
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff0B0B0B),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'You have successfully added\n a card to your wallet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffAAA8BD),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Color(0xff02003D),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text('Done',
                                  style: TextStyle(
                                    fontFamily: 'SF-Pro',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )),
                  ),
                );
                // Navigator.of(context).pop();
              },
              color: Color(0xff02003D),
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'Add Card',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
