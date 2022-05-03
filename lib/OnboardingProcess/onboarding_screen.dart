//  prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/OnboardingProcess/sign_up_screen.dart';

import 'log_in_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xff0B0B0B,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 76),
              child: SvgPicture.asset(
                'assets/onboarding_screen_svg_white.svg',
                height: 34,
                width: 154,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/onboarding_card.png'),
            ),
            const SizedBox(
              height: 66,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Manage all your cards ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SF-Pro',
                    fontSize: 28,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              //this text was wrapped by container for automatic allignment
              child: Container(
                child: const Text(                                                                                                                                                                                              
                  'Hold and manage all your card information safely, on one platform.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF-Pro',
                      color: Color(0xffAAA8BD)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                          (route) => false);
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (builder) => const LoginScreen()),
                            );
                    },
                    color: const Color(0xff32363C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
