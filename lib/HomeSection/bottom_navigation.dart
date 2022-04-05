// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:one_wallet/HomeSection/my_cards_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Widget> _screens = [
    MyCards(),
    Scaffold(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      //create a floating action bar with floatingActionButtonLocation center docked and icon : Icons.add
      floatingActionButton: Container(
        height: 56,
        width: 56,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Iconsax.add,
              color: Colors.white,
            ),
            backgroundColor: Color(0xff02003D),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Color(0xffFAFAFA),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'My cards',
            icon: _selectedIndex == 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child:
                        SvgPicture.asset('assets/bottom_navbar_card_blue.svg'),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Iconsax.cards,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: _selectedIndex == 1
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: SvgPicture.asset(
                        'assets/bottom_navbar_setting_blue.svg'),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(
                      Iconsax.setting,
                      color: Color(0xffAAA8BD),
                    ),
                  ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff02003D),
        unselectedItemColor: Color(0xffAAA8BD),
        onTap: _onItemTapped,
      ),
    );
  }
}
