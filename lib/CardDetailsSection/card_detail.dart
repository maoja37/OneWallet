// ignore_for_file: prefer_const_literals_to_create_immutables,

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_wallet/CardDetailsSection/edit_card_screen.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/widgets/dummy_card_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CardDetails extends StatefulWidget {
  final CardData cardModel;
  const CardDetails({required this.cardModel, Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

late AppDatabase database;
bool _isDeleted = false;
class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
  database = Provider.of<AppDatabase>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                  )),
              const SizedBox(height: 32),
              DummyCardWidget(cardModel: widget.cardModel),
              const SizedBox(height: 50),
              const Text(
                'Manage card',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0B0B0B)),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                //this function copies only the card number
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: widget.cardModel.cardNumber))
                      .then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Card number copied to clipboard'),
                              duration: Duration(seconds: 2),
                            ),
                          ));
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 20),
                  leading: SvgPicture.asset('assets/copy_tiny_svg.svg'),
                  title: const Text(
                    'Copy card details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff505780),
                    ),
                  ),
                  subtitle: const Text(
                    'Copy card number, name and expiry date',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () async {
                  var res = await Navigator.of(context).push(PageTransition(child: EditCardScreen(cardModel: widget.cardModel), type: PageTransitionType.rightToLeft)     );
                  if (res != null && res == true) {
                    
                    Navigator.pop(context);
                  }
                },                                                                                                                                                                            
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(Iconsax.setting_4, color: Color(0xff02003D)),
                  title: Text(
                    'Edit card',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff505780),
                    ),
                  ),
                  subtitle: Text(
                    'Change your card details',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () async {
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
                _isDeleted ? database.deleteCard(widget.cardModel) : null;

                Navigator.pop(context);                                      
              },
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(Iconsax.trash, color: Color(0xff02003D)),
                  title: Text(
                    'Delete card',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff505780),
                    ),
                  ),
                  subtitle: Text(
                    'Delete this card',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
