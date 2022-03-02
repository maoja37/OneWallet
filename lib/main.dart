import 'package:flutter/material.dart';
import 'package:one_wallet/OnboardingProcess/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     precacheImage(AssetImage('assets/onboarding_card.png'), context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Gotham',
        ),
        home: SplashScreen());
  }
}
 