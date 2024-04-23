import 'package:beonchat_admin/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataStyle {
  static ThemeData themeData(bool dark, BuildContext context) {
    return ThemeData(
      /// Brightness
      brightness: dark ? Brightness.dark : Brightness.light,

      /// Primary Color
      primaryColor: Colours().primary,
      scaffoldBackgroundColor: Colours().scaffoldBg(dark),
      canvasColor: Colours().trans,

      /// AppBar Theme
      appBarTheme: AppBarTheme(
          backgroundColor: Colours().scaffoldBg(dark),
          iconTheme: dark ? null : IconThemeData(color: Colours().iconColor),
          actionsIconTheme:
              dark ? null : IconThemeData(color: Colours().iconColor)),

      /// Card Theme
      cardTheme: CardTheme(color: Colours().cardColor(dark)),
      cardColor: Colours().cardColor(dark),

      /// Divider Theme
      dividerTheme:
          DividerThemeData(color: Colours().dividerColor(dark), thickness: 1),
      dividerColor: Colours().dividerColor(dark),

      /// Bottom AppBar Theme
      bottomAppBarTheme: BottomAppBarTheme(
          color: Colours().bottomAppColor(dark), elevation: 2),

      /// Tab bar Theme
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colours().iconColor,
        labelColor: Colours().primary,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colours().primary, width: 2.0),
        ),
      ),

      /// CheckBox theme
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(
            dark ? Colours().white.withAlpha(100) : Colours().dark5),
        fillColor: MaterialStateProperty.all(Colours().primary),
      ),

      /// Radio theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(Colours().primary),
      ),

      ///Switch Theme
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((state) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.focused,
            MaterialState.selected,
          };
          if (state.any(interactiveStates.contains)) {
            return Colours().lightPurple;
          }
          return null;
        }),
        thumbColor: MaterialStateProperty.resolveWith((state) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.focused,
            MaterialState.selected,
          };
          if (state.any(interactiveStates.contains)) {
            return Colours().primary;
          }
          return null;
        }),
      ),

      textTheme: TextTheme(
          titleLarge: GoogleFonts.aBeeZee(), bodyLarge: GoogleFonts.abel()),

      /// Other Colors
      splashColor: Colours().splashColor(dark),
      indicatorColor: Colours().indicatorColor(dark),
      highlightColor: Colours().highlightColor(dark),
      colorScheme: ColorScheme.fromSeed(
              seedColor: Colours().primary,
              brightness: dark ? Brightness.dark : Brightness.light)
          .copyWith(background: Colours().scaffoldBg(dark))
          .copyWith(error: Colours().red),
    );
  }
}
