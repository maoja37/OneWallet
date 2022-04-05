// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:one_wallet/HomeSection/my_cards_screen.dart';
import 'package:iconsax/iconsax.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'My cards',
            icon: Icon(
              Iconsax.cards,
              color:Color(0xffAAA8BD),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              Iconsax.setting,
              color: Color(0xffAAA8BD),
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
