// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'change_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff002003D)),
              ),
              SizedBox(height: 54),
              Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 20,
                  color: Color(0xff505780),
                ),
              ),
              SizedBox(height: 24),
              Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff002003D),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 32,
                      child: Image.asset('assets/profile_picture.png'),
                    ),
                    title: Text(
                      'Jenny wilson',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text('jennywilson@gmail.com',
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAAA8BD),
                        )),
                  )),
              SizedBox(height: 30),
              Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 20,
                  color: Color(0xff505780),
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                //use onTap to navigate to ChangePasswordScreen
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.key,
                      size: 16,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                  title: Text(
                    'Change password',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xff0B0B0B),
                    ),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(CupertinoIcons.right_chevron,
                        color: Color(0xffAAA8BD)),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _toggled,
                onChanged: (value) {
                  setState(() {
                    _toggled = value;
                  });
                },
                secondary: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    'assets/fingerprint_tiny_svg.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
                title: Text(
                  'Enable finger print/Face ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff0B0B0B),
                  ),
                ),
                activeColor: Color(0xff002003D),
              ),
              SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(Iconsax.import, size: 16, color: Color(0xffAAA8BD),)
                ),
                title: Text(
                  'Import settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff0B0B0B),
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(CupertinoIcons.right_chevron,
                      color: Color(0xffAAA8BD)),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(Iconsax.export, size: 16, color: Color(0xffAAA8BD),)
                ),
                title: Text(
                  'Export settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff0B0B0B),
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(CupertinoIcons.right_chevron,
                      color: Color(0xffAAA8BD)),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(Iconsax.info_circle, size: 16, color: Color(0xffAAA8BD),)
                ),
                title: Text(
                  'Help',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff0B0B0B),
                  ),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(CupertinoIcons.right_chevron,
                      color: Color(0xffAAA8BD)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
