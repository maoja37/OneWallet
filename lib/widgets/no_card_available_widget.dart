// ignore_for_file: prefer_const_literals_to_create_immutables, 

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoCardWidget extends StatelessWidget {
  const NoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //this is the  widget that shows in case if there's no card available in database
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/no_card_available_illustration.svg',
            ),
            const SizedBox(height: 30),
            const Text(
              'You have no card in your wallet',
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff505780),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
