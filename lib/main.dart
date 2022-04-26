// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:one_wallet/OnboardingProcess/splash_screen.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/database/database.dart';
import 'package:one_wallet/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/onboarding_card.png'), context);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            'assets/no_card_available_illustration.svg'),
        context);
    return Provider(
      create: (_) => AppDatabase(),
      child: DismissKeyboard(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Gotham',
            ),
            home: SplashScreen()),
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
