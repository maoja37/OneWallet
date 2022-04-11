// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:one_wallet/CardDetailsSection/card_detail.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:one_wallet/widgets/bank_tile_widget.dart';
import 'package:one_wallet/widgets/no_card_available_widget.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class BankListWidget extends StatefulWidget {
  const BankListWidget({Key? key}) : super(key: key);

  @override
  State<BankListWidget> createState() => _BankListWidgetState();
}

class _BankListWidgetState extends State<BankListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    final cards = provider.cardModelList;

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
                              cardModel: cards[index],
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                          ),
                        ),
                    child: BankTile(
                      cardModel: cards[index],
                    ));
          }),
          separatorBuilder: (context, _) {
            return SizedBox(height: 8);
          },
          itemCount: cards.length),
    );
  }
}
