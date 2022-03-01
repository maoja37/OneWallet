import 'package:flutter/material.dart';
import 'package:one_wallet/OnboardingProcess/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 7000), () {});

    Navigator.of(context).pushReplacement(PageTransition(
      child: OnboardingScreen(),
      type: PageTransitionType.fade,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Align(alignment: Alignment.centerRight, child: Image.asset('assets/Group5875.png'))
      ),
    );
  }
}
