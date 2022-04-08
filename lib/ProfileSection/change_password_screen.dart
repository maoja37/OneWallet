// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 66,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.arrow_left, color: Color(0xff292D32), size: 18,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.192,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0B0B0B),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 80,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Enter old password',
                      hintStyle: TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Enter new password',
                      hintStyle: TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Confirm new password',
                      hintStyle: TextStyle(
                          color: Color(0xffAAA8BD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: Color(0xffFAFBFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(height: 56,),
                MaterialButton(
                  onPressed: () {
                     Navigator.of(context).pop();
                  },
                  color: Color(0xff02003D),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    'Change password',
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
