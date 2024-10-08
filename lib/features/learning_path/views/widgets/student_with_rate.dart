import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/rate_widget.dart';
import 'package:flutter/material.dart';


class StudentWithRate extends StatelessWidget {
  final double rate;
  final int studentCount;
  const StudentWithRate({
    super.key, required this.rate, required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            '$studentCount طالب',
            style: Styles.style14(context)
        ),
        const SizedBox(width: 16),
         RateWidget(textSize: 14,rate: rate,),
      ],
    );
  }
}

