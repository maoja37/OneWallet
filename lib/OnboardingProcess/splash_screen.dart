// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_wallet/HomeSection/bottom_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/OnboardingProcess/onboarding_screen.dart';

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

     User? user =  FirebaseAuth.instance.currentUser;

     print(user);
     if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
     } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
     }


    
  }



                         
                                               

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          'assets/onboarding_screen_svg_black.svg',
          width: 223,
          height: 48,
        ),
      ),
    );
  }
}
