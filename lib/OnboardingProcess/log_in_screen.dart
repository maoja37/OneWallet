// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/HomeSection/bottom_navigation.dart';
import 'package:one_wallet/HomeSection/my_cards_screen.dart';
import 'package:one_wallet/OnboardingProcess/sign_up_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: close_sinks

  bool hasError = false;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forgotPasswordEmailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 86, left: 24, right: 24),
          child: Form(
            key: formKey,
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
                        fontFamily: 'SF-Pro',
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
                      fontFamily: 'SF-Pro',
                      color: Color(0xff505780),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                            color: Color(0xffAAA8BD),
                            fontSize: 14,
                            fontFamily: 'SF-Pro',
                            fontWeight: FontWeight.w400),
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
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter password',
                        hintStyle: TextStyle(
                            color: Color(0xffAAA8BD),
                            fontSize: 14,
                            fontFamily: 'SF-Pro',
                            fontWeight: FontWeight.w400),
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigationScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } on FirebaseAuthException catch (e) {
                          print(e);
                          if (e.code == 'invalid-email') {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('Please enter valid email'),
                            ));
                          } else if (e.code == 'user-disabled') {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('User disabled'),
                            ));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('Wrong Password entered'),
                            ));
                          } else if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('User not found'),
                            ));
                          } else {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('User disabled'),
                            ));
                          }
                        }
                      }
                    },
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
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/fingerpint.svg',
                      width: 45,
                      height: 49,
                    ),
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
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _showFingerprintSheet(BuildContext context) {
  //   showFlexibleBottomSheet(
  //     minHeight: 0,
  //     initHeight: 0.412,
  //     maxHeight: 0.412,
  //     context: context,
  //     builder: (context, controller, offset) {
  //       return Material(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(32),
  //           topRight: Radius.circular(32),
  //         ),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             color: Color(0xFFFFFFFF),
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(32),
  //               topRight: Radius.circular(32),
  //             ),
  //           ),
  //           child: ListView(
  //             controller: controller,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 24),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     SizedBox(
  //                       height: 32,
  //                     ),
  //                     SvgPicture.asset('assets/Rectangle.svg'),
  //                     SizedBox(
  //                       height: MediaQuery.of(context).size.height * 0.080,
  //                     ),
  //                     SvgPicture.asset('assets/fingerprint_login.svg'),
  //                     SizedBox(
  //                       height: 32,
  //                     ),
  //                     Text(
  //                       'Touch ID sensor to sign in',
  //                       style: TextStyle(
  //                         fontFamily: 'SF-Pro',
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w500,
  //                         color: Color(0xff02003D),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextField(
                          controller: _forgotPasswordEmailController,
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
                        onPressed: () async {
                          if (_forgotPasswordEmailController.text.isEmpty) {
                            ScaffoldMessenger.of(formKey.currentState!.context)
                                .showSnackBar(SnackBar(
                              content: Text('There is no email entered'),
                            ));
                          } else {
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email:
                                          _forgotPasswordEmailController.text);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(
                                      formKey.currentState!.context)
                                  .showSnackBar(SnackBar(
                                content: Text('Email sent'),
                              ));
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(
                                      formKey.currentState!.context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.code),
                              ));
                            }
                          }
                        },
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

  // void _showSecondSheet(BuildContext context) {
  //   TextEditingController textEditingController = TextEditingController();
  //   showFlexibleBottomSheet(
  //     minHeight: 0,
  //     initHeight: 0.5,
  //     maxHeight: 0.5,
  //     context: context,
  //     builder: (context, controller, offset) {
  //       return Material(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(32),
  //           topRight: Radius.circular(32),
  //         ),
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             color: Color(0xFFFFFFFF),
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(32),
  //               topRight: Radius.circular(32),
  //             ),
  //           ),
  //           child: ListView(
  //             controller: controller,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 24),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     SizedBox(
  //                       height: 32,
  //                     ),
  //                     SvgPicture.asset('assets/Rectangle.svg'),
  //                     SizedBox(
  //                       height: 32,
  //                     ),
  //                     Text(
  //                       'Enter OTP',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w700,
  //                         color: Color(0xff0B0B0B),
  //                         fontSize: 24,
  //                       ),
  //                     ),
  //                     SizedBox(height: 6),
  //                     Text(
  //                       'Enter the 6-digit code sent to your email',
  //                       style: TextStyle(
  //                           color: Color(0xff505780),
  //                           fontWeight: FontWeight.w400,
  //                           fontFamily: 'Gotham',
  //                           fontSize: 14),
  //                     ),
  //                     SizedBox(
  //                       height: 40,
  //                     ),
  //                     Form(
  //                       key: formKey,
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                             border: Border.all(
  //                               width: 1,
  //                               color: Color(0xffFFFFFF),
  //                             ),
  //                             borderRadius: BorderRadius.circular(12)),
  //                         padding: EdgeInsets.only(
  //                             left: 60, right: 60, top: 15, bottom: 5),
  //                         child: PinCodeTextField(
  //                           appContext: context,
  //                           pastedTextStyle: TextStyle(
  //                             color: Colors.green.shade600,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                           length: 6,
  //                           obscureText: true,

  //                           blinkWhenObscuring: true,
  //                           animationType: AnimationType.fade,

  //                           pinTheme: PinTheme(
  //                             fieldWidth: 18,
  //                             fieldHeight: 28,
  //                             activeColor: Color(0xffd2d2d2),
  //                             inactiveColor: Color(0xffd2d2d2),
  //                             activeFillColor: Colors.white,
  //                           ),
  //                           cursorColor: Colors.transparent,
  //                           animationDuration: Duration(milliseconds: 100),
  //                           // enableActiveFill: true,

  //                           //I  removed error controller here because it was giving me issues , to put back later

  //                           controller: textEditingController,
  //                           keyboardType: TextInputType.number,

  //                           onCompleted: (v) {
  //                             print("Completed");
  //                           },

  //                           onChanged: (value) {
  //                             print(value);
  //                             setState(() {
  //                               currentText = value;
  //                             });
  //                           },
  //                           beforeTextPaste: (text) {
  //                             print("Allowing to paste $text");
  //                             //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
  //                             //but you can show anything you want here, like your pop up saying wrong paste format or etc
  //                             return true;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 48,
  //                     ),
  //                     MaterialButton(
  //                       onPressed: () {},
  //                       color: Color(0xff02003D),
  //                       minWidth: double.infinity,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(24),
  //                       ),
  //                       padding: EdgeInsets.symmetric(vertical: 20),
  //                       child: Text(
  //                         'Verify',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.w500),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
