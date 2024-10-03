import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


abstract class Styles {
  static InputBorder setOutlinedBorder(BuildContext context,
          {double radius = 8, bool isErrorBorder = false, double width = 1}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
              color: isErrorBorder
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onSurface,
              width: width));

  static TextStyle style32(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.changa().fontFamily,
        fontSize: 32,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600);
  }

  static TextStyle style24(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.changa().fontFamily,
        fontSize: 24,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.bold);
  }

  static TextStyle style20(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: 20,
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.bold);
  }
  static TextStyle style18(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.changa().fontFamily,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600);
  }

  static TextStyle style16(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.normal);
  }

  static TextStyle style14(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: 14,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.normal);
  }

  static TextStyle style12(BuildContext context) {
    return TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: 12,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.normal);
  }
}
