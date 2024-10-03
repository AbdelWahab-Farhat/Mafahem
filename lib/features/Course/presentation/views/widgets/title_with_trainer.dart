import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithTrainer extends StatelessWidget {
  const TitleWithTrainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.67,
          child: Text(
            "علم الاحياء الداخلي",
            style: Styles.style18(context),
          ),
        ),
        const SizedBox(height: 4,),
        SizedBox(
          width: SizeConfig.screenWidth * 0.67,
          child: Text('المدرب :دادي يوسف ',
              style: Styles.style14(context).copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: GoogleFonts.changa().fontFamily)),
        ),
      ],
    );
  }
}
