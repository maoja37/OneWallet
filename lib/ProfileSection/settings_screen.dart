//  prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_wallet/ProfileSection/update_username.dart';
import 'change_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _prefs = SharedPreferences.getInstance();
  bool _toggled = false;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    
    getRealPreferences();
    super.initState();
  }

  getRealPreferences() async {
    SharedPreferences prefs = await _prefs;
    setState(() {
      _toggled = prefs.getBool('fingerprintAllowed') ?? false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff02003D)),
              ),
              const SizedBox(height: 54),
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 20,
                  color: Color(0xff505780),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff02003D),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 32,
                      child: Image.asset('assets/profile_picture.png'),
                    ),
                    title: Text(
                      currentUser != null && currentUser!.displayName != null
                          ? currentUser!.displayName!
                          : 'Jenny wilson',
                      style: const TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                        currentUser != null
                            ? currentUser!.email!
                            : 'johndoe@gmail.com',
                        style: const TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAAA8BD),
                        )),
                  )),
              const SizedBox(height: 30),
              const Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 20,
                  color: Color(0xff505780),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                //use onTap to navigate to ChangePasswordScreen
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.key,
                      size: 16,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
                  title: const Text(
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
                    child: const Icon(CupertinoIcons.right_chevron,
                        color: Color(0xffAAA8BD)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _toggled,
                onChanged: (value) async {
                  SharedPreferences prefs = await _prefs;
                  setState(() {
                    _toggled = value;

                    prefs.setBool('fingerprintAllowed', _toggled);
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
                title: const Text(
                  'Enable finger print/Face ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xff0B0B0B),
                  ),
                ),
                activeColor: const Color(0xff02003D),
              ),
              const SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.import,
                      size: 16,
                      color: Color(0xffAAA8BD),
                    )),
                title: const Text(
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
                  child: const Icon(CupertinoIcons.right_chevron,
                      color: Color(0xffAAA8BD)),
                ),
              ),
              const SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.export,
                      size: 16,
                      color: Color(0xffAAA8BD),
                    )),
                title: const Text(
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
                  child: const Icon(CupertinoIcons.right_chevron,
                      color: Color(0xffAAA8BD)),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UpdateUsernameScreen(),
                )),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Iconsax.info_circle,
                        size: 16,
                        color: Color(0xffAAA8BD),
                      )),
                  title: const Text(
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
                    child: const Icon(CupertinoIcons.right_chevron,
                        color: Color(0xffAAA8BD)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
