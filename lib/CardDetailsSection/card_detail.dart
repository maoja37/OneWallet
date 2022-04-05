// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:one_wallet/models/card_model.dart';

import 'package:one_wallet/widgets/dummy_card_widget.dart';
import 'package:iconsax/iconsax.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CardDetails extends StatelessWidget {
  final CardModel cardModel;
  const CardDetails({required this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                  )),
              SizedBox(height: 32),
              DummyCardWidget(cardModel: cardModel),
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
              ListTile(
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
              SizedBox(height: 4),
              ListTile(
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
              SizedBox(height: 4),
              ListTile(
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
            ],
          ),
        ),
      ),
    );
  }
}
