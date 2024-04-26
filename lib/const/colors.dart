import 'package:flutter/material.dart';

/// initializing colors
class Colours {
  Color primary = const Color(0xFF1CA990);
  Color secondary = const Color(0xFF221F20);
  Color ternary = const Color(0xFF2B3332);
  Color grey = const Color(0xFF747474);
  Color iconColor = const Color(0xff495057);
  Color lightPurple = const Color(0xffabb3ea);
  Color grey2 = const Color(0xff2c3036);
  Color grey3 = const Color(0xff313a46);
  Color grey4 = const Color(0xffdcdcdc);
  Color grey5 = const Color(0xff282c32);
  Color red = const Color(0xfff0323c);
  Color danger = const Color(0xffdc3545);
  Color red2 = const Color(0xffdc3545);
  Color lightBg = const Color(0xffF5F5F5);
  Color darkBg = const Color(0xff262729);
  Color warning = const Color(0xffffc107);
  Color pink = const Color(0xffFF1087);
  Color success = const Color(0xff00be82);
  Color blue = const Color(0xff3874ff);
  Color info = const Color(0xff0dcaf0);
  Color lightBlue = const Color(0xff0dcaf0);
  Color red3 = const Color(0xffFF0000);
  Color black = Colors.black;
  Color white = Colors.white;
  Color trans = Colors.transparent;
  Color light1 = const Color(0xff6c757d);
  Color dark1 = const Color(0xff879baf);
  Color light3 = const Color(0xfff0f0f0);
  Color dark3 = const Color(0xff222327);
  Color light4 = const Color(0xffe8e8e8);
  Color dark4 = const Color(0xff363636);
  Color light5 = const Color(0xff464c52);
  Color dark5 = const Color(0xffeeeeee);
  Color light6 = const Color(0xffeefaf8);
  Color dark6 = const Color(0xff363c44);

  Color labelColor(bool dark) {
    return dark ? dark1 : light1;
  }

  Color scaffoldBg(bool dark) {
    return dark ? darkBg : lightBg;
  }

  Color appBarBgColor(bool dark) {
    return dark ? grey2.withAlpha(246) : white.withAlpha(246);
  }

  Color appBarOnBgColor(bool dark) {
    return dark ? grey4 : grey3;
  }

  Color drawerBgColor(bool dark) {
    return dark ? grey5 : white;
  }

  Color cardColor(bool dark) {
    return dark ? dark3 : white;
  }

  Color dividerColor(bool dark) {
    return dark ? dark4 : light4;
  }

  Color bottomAppColor(bool dark) {
    return dark ? dark5 : light5;
  }

  Color splashColor(bool dark) {
    return dark ? white.withAlpha(56) : white.withAlpha(100);
  }

  Color indicatorColor(bool dark) {
    return dark ? white : dark5;
  }

  Color highlightColor(bool dark) {
    return dark ? white.withAlpha(28) : dark5;
  }

  Color activeCardColor(bool dark) {
    return dark ? dark6 : light6;
  }

  Color activeItemColor(bool dark) {
    return dark ? white : primary;
  }
}
