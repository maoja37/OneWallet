// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_wallet/CardDetailsSection/card_detail.dart';
import 'package:one_wallet/models/card_model.dart';
import 'package:one_wallet/widgets/bank_tile_widget.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  CardModel gtbank = CardModel(
    bankName: 'GTBank',
    cardNumber: '1234567890123456',
    expiryDate: '12/20',
    cardHolderName: 'John Doe',
    cvvCode: '123',
  );
  String sfpro = 'SF-Pro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 76),
            SvgPicture.asset(
              'assets/onboarding_screen_svg_black.svg',
              width: 154,
              height: 34,
            ),
            SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 36,
                  ),
                  width: double.infinity,
                  height: 148,
                  decoration: BoxDecoration(
                    color: Color(0xff02003D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Hi ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: sfpro,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: 'Peter',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              )
                            ]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Color(0xffAAA8BD),
                          fontFamily: sfpro,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffFFFFFF).withOpacity(.24),
                        ),
                        child: Text('Add Card',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily: sfpro,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: -40,
                    child: Image.asset(
                      'assets/man_holding_cup.png',
                      width: 264,
                      height: 211,
                    ))
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My cards',
                  style: TextStyle(
                      fontFamily: sfpro,
                      fontSize: 16,
                      color: Color(0xff505780),
                      fontWeight: FontWeight.w400),
                ),
                Text('+ Add card',
                    style: TextStyle(
                        fontFamily: sfpro,
                        fontSize: 14,
                        color: Color(0xff5F00F8),
                        fontWeight: FontWeight.w400))
              ],
            ),
            SizedBox(height: 24),
            GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => CardDetails(
                          cardModel: gtbank,
                        ))),
                child: BankTile(
                  cardModel: gtbank,
                ))
          ],
        ),
      ),
    );
  }
}
