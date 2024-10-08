import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/rate_widget.dart';
import 'package:flutter/material.dart';


class RateWithStudentNumber extends StatelessWidget {
  const RateWithStudentNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("10000 طالب",style: Styles.style16(context),),
        RateWidget(),
      ],
    );
  }
}

