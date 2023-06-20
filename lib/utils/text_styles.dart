import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle textStyle({
    double? fontSize,
    Color? color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      );
}
