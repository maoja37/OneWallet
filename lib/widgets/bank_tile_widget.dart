// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:one_wallet/models/card_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class BankTile extends StatelessWidget {
  BankTile({required this.cardModel, Key? key}) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 1,
              onPressed: (context) {
                provider.deleteCardModel(cardModel);
              },
              backgroundColor: Colors.red,
              icon: Iconsax.trash,
            )
          ],
        ),
        child: buildBankTile(),
      ),
    );
  }

  Container buildBankTile() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      //create list tile with title = cardModel.bankName, subtitle = cardModel.cardNumber and trailing = SvgPicture.asset('assets/mastercard.svg')
      child: ListTile(
        //reduce inner padding of listtile to 0
        contentPadding: EdgeInsets.zero,
        title: Text(
          cardModel.bankName,
          style: TextStyle(
              fontFamily: 'SF-Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff0B0B0B)),
        ),
        //create subtitle with cardModel.cardNumber that hides the first 4 digits of the number
        subtitle: Text(
          cardModel.cardNumber.replaceRange(0, 4, '****'),
          style: TextStyle(
              fontFamily: 'SF-Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffB5B3C5)),
        ),

        trailing: SvgPicture.asset('assets/mastercard.svg'),
      ),
    );
  }
}
