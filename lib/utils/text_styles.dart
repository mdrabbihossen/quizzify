import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle textStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      GoogleFonts.quicksand(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
}
