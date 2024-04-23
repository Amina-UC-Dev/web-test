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

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget empty() {
    return const SizedBox(width: 0, height: 0);
  }
}
