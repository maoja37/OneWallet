

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/models/card_model.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:one_wallet/widgets/dummy_card_widget.dart';
import 'package:provider/provider.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({required this.cardModel, Key? key}) : super(key: key);

  final CardData cardModel;

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  final _formKey = GlobalKey<FormState>();

  late String previousCardNumber = widget.cardModel.bankName;

  //this variables are controllers attached to Form Fields to monitor them
  late TextEditingController bankNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cvvController;

  //this variables are used to store the values of the form fields
  String bankName = '';
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  //use this to keep track of when the form is submitted
  bool _submitted = false;

  late AppDatabase _database;

  @override
  void dispose() {
    //dispose all controllers
    bankNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    bankNameController = TextEditingController(text: widget.cardModel.bankName);
    cardNumberController =
        TextEditingController(text: widget.cardModel.cardNumber);
    expiryDateController =
        TextEditingController(text: widget.cardModel.expiryDate);
    cardHolderNameController =
        TextEditingController(text: widget.cardModel.cardHolderName);
    cvvController = TextEditingController(text: widget.cardModel.cvvCode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _database = Provider.of<AppDatabase>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 66,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Color(0xff292D32),
                        size: 18,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                    const Text(
                      'Edit Card',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0B0B0B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                DummyCardWidget(
                  cardModel: CardData(
                    id: 1,
                    cardNumber: widget.cardModel.cardNumber,
                    bankName: widget.cardModel.bankName,
                    cardHolderName: widget.cardModel.cardHolderName,
                    expiryDate: widget.cardModel.expiryDate,
                    cvvCode: widget.cardModel.cvvCode,
                  ),
                ),
                const SizedBox(height: 36),
                TextFormField(
                  //initialValue: widget.cardModel.bankName,
                  controller: bankNameController,
                  keyboardType: TextInputType.text,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Bank name',
                      hintStyle: const TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: const Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: cardHolderNameController,
                  keyboardType: TextInputType.text,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Card Holder name',
                      hintStyle: const TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: const Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cardNumberController,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Please enter card number';
                    }
                    if (text.length != 16) {
                      return 'Please enter valid card number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Card Number',
                      hintStyle: const TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: const Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Please enter cvv code';
                    }
                    if (text.length != 3) {
                      return 'Please enter valid cvv code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'CVV',
                      hintStyle: const TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: const Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: expiryDateController,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Please enter expiry date';
                    }
                    if (text.length != 5) {
                      return 'Please enter valid expiry date';
                    }
                    if (!text.contains('/')) {
                      return 'Please input expiry date in format MM/YY';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      helperText: 'MM/YY',
                      filled: true,
                      hintText: 'Expiry Date',
                      hintStyle: const TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: const Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                const SizedBox(
                  height: 36,
                ),
                MaterialButton(
                  onPressed: () async {
                    setState(() {
                      _submitted = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      bankName = bankNameController.text;
                      cardHolderName = cardHolderNameController.text;
                      cardNumber = cardNumberController.text;
                      cvvCode = cvvController.text;
                      expiryDate = expiryDateController.text;

                      _database.updateCard(CardData(
                          id: widget.cardModel.id,
                          bankName: bankName,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode));

                      await _showCompletedDialog(context);

                      Navigator.pop(context,true);
                    }
                  },
                  color: const Color(0xff02003D),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                        fontFamily: 'SF-Pro',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showCompletedDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/dialog_illustration.png',
                width: 109, height: 109),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Welldone!',                
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff0B0B0B),
              ),
            ),                      
            const SizedBox(
              height: 4,
            ),
            const Text(
              'You have successfully\nupdated this card details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xffAAA8BD),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: const Color(0xff02003D),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 62),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text('Done',
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }



}
