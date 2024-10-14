import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmptyStateWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget image;
  final Widget? button;
  const CustomEmptyStateWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.button,
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          const SizedBox(height: 20,),
          Text(
            title,
            style: Styles.style20(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: GoogleFonts.changa().fontFamily,
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            subTitle,
            style: Styles.style16(context).copyWith(fontFamily: GoogleFonts.changa().fontFamily,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8,),
          button ?? const SizedBox()
        ],
      ),
    );
  }
}
