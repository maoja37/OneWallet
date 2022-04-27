// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:one_wallet/CardDetailsSection/card_detail.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/widgets/bank_tile_widget.dart';
import 'package:page_transition/page_transition.dart';

class BankListWidget extends StatefulWidget {
  final List<CardData> cardList;
  const BankListWidget({Key? key, required this.cardList}) : super(key: key);

  @override
  State<BankListWidget> createState() => _BankListWidgetState();
}

class _BankListWidgetState extends State<BankListWidget> {


  @override
  Widget build(BuildContext context) {


    return Flexible(
      fit: FlexFit.loose,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          PageTransition(
                            child: CardDetails(
                              cardModel: widget.cardList[index],
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                          ),
                        ),
                    child: BankTile(
                      cardModel: widget.cardList[index],
                    ));
          }),
          separatorBuilder: (context, _) {
            return SizedBox(height: 8);
          },
          itemCount: widget.cardList.length),
    );
  }
}
