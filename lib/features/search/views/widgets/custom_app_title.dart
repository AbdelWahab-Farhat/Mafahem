import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'مفا',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.changa().fontFamily,
            color: Theme.of(context).colorScheme.primary),
      ),
      TextSpan(
          text: 'هيم',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.changa().fontFamily,
              color: Theme.of(context).colorScheme.secondary)),
    ]));
  }
}
