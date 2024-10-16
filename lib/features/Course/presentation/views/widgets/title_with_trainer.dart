import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithTrainer extends StatelessWidget {
  final Course course;
  const TitleWithTrainer({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.67,
          child: Text(
            course.title,
            style: Styles.style18(context),
          ),
        ),
        const SizedBox(height: 4,),
        SizedBox(
          width: SizeConfig.screenWidth * 0.67,
          child: Text('المدرب : ${course.instructorName}',
              style: Styles.style14(context).copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: GoogleFonts.changa().fontFamily)),
        ),
      ],
    );
  }
}
