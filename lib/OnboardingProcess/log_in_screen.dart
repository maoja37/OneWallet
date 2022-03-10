// ignore_for_file: prefer_const_constructors

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/OnboardingProcess/sign_up_screen.dart';

import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 86, left: 24, right: 24,),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(   
                  'assets/one_wallet_logo.svg',
                  width: 56,
                  height: 56,
                ),
                SizedBox(
                  height: 40,
                ),  
                Text( 
                  'Welcome!',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Hey there, enter your\ndetails to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff505780),
                  ),
                ),
                SizedBox(
                  height: 56,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Email Address',
                      labelStyle:
                          TextStyle(color: Color(0xffAAA8BD), fontSize: 14),
                      floatingLabelStyle: TextStyle(color: Color(0xff02003D)),
                      fillColor: Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Enter Password',
                      labelStyle:
                          TextStyle(color: Color(0xffAAA8BD), fontSize: 14),
                      floatingLabelStyle: TextStyle(color: Color(0xff02003D)),
                      fillColor: Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => _showSheet(context),
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Color(0xff5F00F8),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Color(0xff02003D),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                SvgPicture.asset(
                  'assets/fingerpint.svg',
                  width: 45,
                  height: 49,
                ),
                SizedBox(
                  height: 38,
                ),
                RichText(
                  text: TextSpan(
                    text: 'New to Onewallet? ',
                    style: TextStyle(
                      color: Color(0xffAAA8BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                          text: 'Create account',
                          style: TextStyle(
                            color: Color(0xff5F00F8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (builder) => SignUpScreen()),
                              );
                            })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSheet(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.5,
      context: context,
      builder: (context, controller, offset) {
        return Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
               borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
            ),
            child: ListView(
              controller: controller,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      SvgPicture.asset('assets/Rectangle.svg'),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Forgot password',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0B0B0B),
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Enter email attached to your account',
                        style: TextStyle(
                            color: Color(0xff505780),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gotham',
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                  color: Color(0xffAAA8BD), fontSize: 14),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xff02003D)),
                              fillColor: Color(0xffFAFBFF),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      MaterialButton(
                        onPressed: ()=> _showSecondSheet(context),
                        color: Color(0xff02003D),
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSecondSheet(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.5,
      context: context,
      builder: (context, controller, offset) {
        return Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
               borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
            ),
            child: ListView(
              controller: controller,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      SvgPicture.asset('assets/Rectangle.svg'),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0B0B0B),
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Enter the 6-digit code sent to your mail',
                        style: TextStyle(
                            color: Color(0xff505780),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gotham',
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                color: Color(0xffAAA8BD), fontSize: 14),
                            floatingLabelStyle:
                                TextStyle(color: Color(0xff02003D)),
                            fillColor: Color(0xffFAFBFF),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Color(0xff02003D),
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
