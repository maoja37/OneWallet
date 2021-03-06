//  prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_wallet/HomeSection/bottom_navigation.dart';

class UpdateUsernameScreen extends StatefulWidget {
  const UpdateUsernameScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUsernameScreen> createState() => _UpdateUsernameScreenState();
}

class _UpdateUsernameScreenState extends State<UpdateUsernameScreen> {
  final TextEditingController userNameEditingController =
      TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  final formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 66,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Color(0xff292D32),
                            size: 18,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.192,
                      ),
                      const Text(
                        'What is your First Name?',
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0B0B0B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: userNameEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.length > 17) {
                        return 'Please enter a name less than 17 characters';
                      }
                      if (value.contains(' ')) {
                        return 'Please enter only First name ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(
                            color: Color(0xffAAA8BD),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        fillColor: const Color(0xffFAFBFF),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      String stuff = userNameEditingController.text;
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });

                        await user
                            ?.updateDisplayName(stuff)
                            .then((value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationScreen())))
                            .catchError((error) => ScaffoldMessenger.of(
                                    formKey.currentState!.context)
                                .showSnackBar(const SnackBar(
                                    content: Text('Error Updating Name'))))
                            .whenComplete(() {});

                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    color: const Color(0xff02003D),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: loading
                        ? const SizedBox(
                            height: 11,
                            width: 11,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ))
                        : const Text(
                            'Update Name',
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
}
