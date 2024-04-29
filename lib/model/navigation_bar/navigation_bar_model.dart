import 'package:flutter/material.dart';

class NavigationBarModel {
  String title;
  List<NavBarItem> items;

  NavigationBarModel({required this.title, required this.items});
}

class NavBarItem {
  String title;
  IconData icon;
  bool multi;
  bool hover;
  bool active;
  List<NavBarItem> subItems;
  String routName;

  NavBarItem({
    required this.title,
    required this.icon,
    required this.multi,
    required this.hover,
    required this.active,
    required this.subItems,
    required this.routName,
  });
}
