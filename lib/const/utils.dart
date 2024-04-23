import 'package:flutter/material.dart';

class UtilsWidget {
  getOutLineBorder(bool isDark,Color color) {
    return  OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
          width: 1,
          strokeAlign: 0,
          color: color
          /*color: theme.colorScheme.onBackground.withAlpha(80)*/),
    );
  }
}
