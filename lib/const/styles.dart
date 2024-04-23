import 'package:beonchat_admin/const/text_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontSize: size,
        letterSpacing: space ?? 0.0,
        decoration: decoration ?? TextDecoration.none);
  }

  text({
    required MyTextType textType,
    required Color color,
    FontWeight? fontW,
    double? size,
    TextDecoration? decoration,
    double? space,
  }) {
    return GoogleFonts.poppins(
        color: color,
        fontWeight: fontW ?? defaultTextFontWeight[textType],
        fontSize: size ?? defaultTextSize[textType],
        letterSpacing: space ?? defaultLetterSpacing[textType],
        decoration: decoration ?? TextDecoration.none);
  }



  logoAppBar(
      {required Color color, required double size, required double space}) {
    return TextStyle(
      fontFamily: "Montserrat ExtraBold",
      color: color,
      fontSize: size,
      letterSpacing: space,
    );
  }
}
