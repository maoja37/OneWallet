// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 86, left: 24, right: 24),
        child: Container(
          alignment: Alignment.center,
          child: Column(
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
                'Create account',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Sign up with the provided \nmeans to continue',
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
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Confirm Password',
                    labelStyle:
                        TextStyle(color: Color(0xffAAA8BD), fontSize: 14),
                    floatingLabelStyle: TextStyle(color: Color(0xff02003D)),
                    fillColor: Color(0xffFAFBFF),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16))),
              ),
              SizedBox(
                height: 40,
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
                  'Create account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
