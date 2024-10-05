import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserImageWithName extends StatelessWidget {
  const UserImageWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 37.5, // Static radius size (140x140 Circle)
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: Image.asset(
              'lib/assets/images/course-image.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'محمد علي كلاي',
          style: Styles.style20(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: GoogleFonts.changa().fontFamily),
        ),
      ],
    );
  }
}
