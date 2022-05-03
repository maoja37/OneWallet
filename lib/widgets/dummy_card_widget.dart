

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/models/card_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyCardWidget extends StatelessWidget {
  final CardData cardModel;
  const DummyCardWidget({required this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [

                  //this is the card background
                  SvgPicture.asset(
                    'assets/big_card_detail.svg',
                    width: MediaQuery.of(context).size.width,
                  ),

                  //this contains all card details like card number, card name, cvv etc
                  Positioned(
                      top: 38,
                      left: 24,
                      child: Container(
                        width: 216,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardModel.bankName,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 40),
                            //create text widget with cardModel.cardNumber and seperate it by 4 digits with space in between
                            Text(
                              cardModel.cardNumber.substring(0, 4) +
                                  '   ' +
                                  cardModel.cardNumber.substring(4, 8) +
                                  '   ' +
                                  cardModel.cardNumber.substring(8, 12) +
                                  '   ' +
                                  cardModel.cardNumber.substring(12, 16),
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card Holder Name',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      cardModel.cardHolderName,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expiry date',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      cardModel.expiryDate,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CVV',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      cardModel.cvvCode,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ))   
                ],
              );
  }
}
