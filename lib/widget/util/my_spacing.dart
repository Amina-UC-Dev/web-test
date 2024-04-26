import 'package:flutter/material.dart';

class MySpacing {
  static SizedBox height(double height) {
    return SizedBox(
      height: height,
    );
  }

  static SizedBox width(double width) {
    return SizedBox(
      width: width,
    );
  }

  static EdgeInsets fromLTRB(
      double left, double top, double right, double bottom) {
    return MySpacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsets only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget empty() {
    return const SizedBox(width: 0, height: 0);
  }

  static EdgeInsets x(double spacing) {
    return MySpacing.only(left: spacing, right: spacing);
  }

  static EdgeInsets y(double spacing) {
    return MySpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsets all(double spacing) {
    return MySpacing.only(
        bottom: spacing, top: spacing, right: spacing, left: spacing);
  }

  static EdgeInsets xy(double xSpacing, double ySpacing) {
    return MySpacing.only(
        left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }
}
