import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageContent extends StatelessWidget {
  final String title;
  final String subTitle;
  const ImageContent({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.style18(context).copyWith(
              fontFamily: GoogleFonts.changa().fontFamily,
              color: Theme.of(context).colorScheme.surface),
        ),
        Text(
          subTitle,
          style: Styles.style14(context)
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
      ],
    );
  }
}
