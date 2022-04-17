import 'package:flutter/material.dart';

final ThemeData basicTheme = _buildBasicTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
      // fontFamily: "OpenSans",
      fontStyle: FontStyle.normal,
      color: Colors.white,
    ),
    headline6: base.headline1.copyWith(
      // fontFamily: "OpenSans",
      fontStyle: FontStyle.normal,
      color: Colors.white,
    ),

    bodyText1: base.bodyText1.copyWith(
      // fontFamily: "OpenSans",
      color: Colors.white,
    ),
    // titleSmall: base.titleSmall.copyWith(
    //   // fontFamily: "OpenSans",
    //   color: Colors.white,
    // ),
  );
}

ThemeData _buildBasicTheme() {
  const Color primaryColor = Colors.orange;
  const Color secondaryColor = Colors.lightGreen;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
//    brightness: Brightness.light,
//    accentColorBrightness: Brightness.light,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    buttonColor: primaryColor,
    indicatorColor: secondaryColor,
    toggleableActiveColor: primaryColor,
    accentColor: secondaryColor,
    // canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF131313),
    // backgroundColor: const Color(0xFF131313),
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    // accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
