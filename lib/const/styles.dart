import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// styles
class Styles {
  normalS({
    required FontWeight fontW,
    required Color color,
    required double size,
    TextDecoration? decoration,
    double? space,
  }) {
    return TextStyle(
        fontFamily: "Gotham",
        color: color,
        fontWeight: fontW,
        fontSize: size.sp,
        letterSpacing: space ?? 0.0,
        decoration: decoration ?? TextDecoration.none);
  }

  normalS2(
      {required FontWeight fontW, required Color color, required double size}) {
    return TextStyle(
        fontFamily: "Gotham",
        color: color,
        fontWeight: fontW,
        fontSize: size.sp,
        height: 1.3,
        letterSpacing: 0);
  }

  normalS3(
      {required FontWeight fontW, required Color color, required double size}) {
    return TextStyle(
        fontFamily: "Gotham",
        color: color,
        fontWeight: fontW,
        fontSize: size.sp,
        height: 1.6,
        letterSpacing: 0);
  }

  gothamBlack(
      {required Color color, required double size, required double space}) {
    return TextStyle(
      fontFamily: "Gotham",
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: size.sp,
      // height: 1.1,
      letterSpacing: space,
    );
  }

  logoAppBar(
      {required Color color, required double size, required double space}) {
    return TextStyle(
      fontFamily: "Montserrat ExtraBold",
      color: color,
      fontSize: size.sp,
      letterSpacing: space,
    );
  }
}
