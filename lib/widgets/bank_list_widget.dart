// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_wallet/CardDetailsSection/card_detail.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/widgets/bank_tile_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:local_auth/local_auth.dart';

class BankListWidget extends StatefulWidget {
  final List<CardData> cardList;
  const BankListWidget({Key? key, required this.cardList}) : super(key: key);

  @override
  State<BankListWidget> createState() => _BankListWidgetState();
}

class _BankListWidgetState extends State<BankListWidget> {

  final LocalAuthentication _authentication = LocalAuthentication();

  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics; 

  



  @override
  void initState() {
    // TODO: implement initState
    _checkBiometrics();
    _getAvailableBiometrics();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
                                                                                                                             

//i surrounded this listview by flexible instead of sizedbox for some weird reason the compiler gave me, so i had to use the flexbit.loose propperty
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return GestureDetector(
                    onTap: () => _authenticate(context, index),
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


    Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await _authentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await _authentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }


//this method is used to check if authenticate the user using fingerprint before showing card details
  Future<void> _authenticate(BuildContext context, int index) async {
    bool authenticated = false;
    try {
      authenticated = await _authentication.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: AuthenticationOptions(stickyAuth: true),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    authenticated ? Navigator.of(context).push(
                          PageTransition(
                            child: CardDetails(
                              cardModel: widget.cardList[index],
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(
                              milliseconds: 500,
                            ),
                          ),
                        ): null;

    setState(() {
      
    });
  }
}
