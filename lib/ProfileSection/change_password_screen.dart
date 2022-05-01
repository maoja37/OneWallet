// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import firebase auth package
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 66,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_left,
                          color: Color(0xff292D32),
                          size: 18,
                        ),
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
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: oldPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your old password';
                      }
                      return null;
                    },
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: newPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your new password';
                      }
                      return null;
                    },
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
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your new password';
                      }
                      if (value != newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
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
                  SizedBox(
                    height: 56,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _changePassword(oldPasswordController.text,
                            confirmPasswordController.text);
                      }
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
              ),
            )),
      ),
    );
  }

  void _changePassword(
      String currentPassword, String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){  final cred = EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);

    try {
      await user.reauthenticateWithCredential(cred);
      try {
        await user.updatePassword(newPassword).then((value) =>   ScaffoldMessenger.of(formKey.currentState!.context)
            .showSnackBar(SnackBar(content: Text('Password Updated')))   );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(formKey.currentState!.context)
            .showSnackBar(SnackBar(content: Text(e.code)));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(formKey.currentState!.context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }}
  
  }
}
