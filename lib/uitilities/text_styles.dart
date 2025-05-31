import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle mainHeadingText({
  Color? color,
  double fontSize = 28,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return TextStyle(
    color: color ?? Colors.deepPurple,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
