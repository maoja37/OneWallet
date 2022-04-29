// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_wallet/CardDetailsSection/edit_card_screen.dart';
import 'package:one_wallet/database/database.dart';

import 'package:one_wallet/models/card_model.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:one_wallet/widgets/dummy_card_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                  )),
              SizedBox(height: 32),
              DummyCardWidget(cardModel: widget.cardModel),
              SizedBox(height: 50),
              Text(
                'Manage card',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0B0B0B)),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: widget.cardModel.cardNumber))
                      .then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Card number copied to clipboard'),
                              duration: Duration(seconds: 2),
                            ),
                          ));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: SvgPicture.asset('assets/copy_tiny_svg.svg'),
                  title: Text(
                    'Copy card details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff505780),
                    ),
                  ),
                  subtitle: Text(
                    'Copy card number, name and expiry date',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () async {
                  var res = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) =>
                          EditCardScreen(cardModel: widget.cardModel)));
                  if (res != null && res == true) {
                    setState(() {});
                    print(res.toString());
                    Navigator.pop(context);
                  }
                },                                                                                                                                                                            
                child: ListTile(
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
              SizedBox(height: 4),
              GestureDetector(
                onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: Text('Delete card'),
                            content: Text(
                                'Are you sure you want to delete this card?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _isDeleted = true;
                                  },
                                  child: Text(
                                    'Yes',
                                    textAlign: TextAlign.end,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'No',
                                    textAlign: TextAlign.end,
                                  ))
                            ]));
                _isDeleted ? database.deleteCard(widget.cardModel) : null;

                Navigator.pop(context);
              },
                child: ListTile(
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
