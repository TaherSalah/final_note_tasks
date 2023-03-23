// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget defualtBottomNavigationBar({
  required List<GButton> tabs,
  required ValueChanged<int> onTabChange,
  required int currentIndex,
  required BuildContext context,
}) =>
    GNav(
      haptic: true,
      tabBackgroundColor: Colors.green.withOpacity(0.5),
      tabBorder: Border.all(color: Colors.white),
      tabBorderRadius: 15,
      tabMargin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      tabShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
      ],
      duration: const Duration(milliseconds: 500),
      gap: 5,
      onTabChange: onTabChange,
      selectedIndex: 0,
      backgroundColor: Colors.black,
      curve: Curves.linear,
      activeColor: Colors.amber,
      color: Colors.white,
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: 16.0, color: Colors.amber, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18.5),
      tabs: tabs,
    );
