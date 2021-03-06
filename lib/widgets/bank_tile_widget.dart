//  prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:one_wallet/database/database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BankTile extends StatelessWidget {
  BankTile({required this.cardModel, Key? key}) : super(key: key);

  final CardData cardModel;

  //this variable is used to control the delete dialog that pops up
  bool _isDeleted = false;

//this is the datbase from drift also called moor
  late AppDatabase database;
  @override
  Widget build(BuildContext context) {
    //this initializes thet database using provider
    database = Provider.of<AppDatabase>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [          
            SlidableAction(
              onPressed: (context) async {                                                      
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text('Delete card'),
                            content: const Text(
                                'Are you sure you want to delete this card?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _isDeleted = true;
                                  },
                                  child: const Text(
                                    'Yes',
                                    textAlign: TextAlign.end,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'No',
                                    textAlign: TextAlign.end,
                                  ))
                            ]));

                //if the user clicks yes on the dialog the card will delete if not, it wont delete
                _isDeleted ? database.deleteCard(cardModel) : null;
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          style: const TextStyle(
              fontFamily: 'SF-Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff0B0B0B)),
        ),
        //create subtitle with cardModel.cardNumber that hides the first 4 digits of the number
        subtitle: Text(
          cardModel.cardNumber.replaceRange(0, 4, '****'),
          style: const TextStyle(
              fontFamily: 'SF-Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffB5B3C5)),
        ),

        trailing: SvgPicture.asset('assets/${cardModel.cardType}card.svg'),
      ),
    );
  }
}
