import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/rate_widget.dart';
import 'package:flutter/material.dart';


class RateWithStudentNumber extends StatelessWidget {
  final Course course;
  const RateWithStudentNumber({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //TODO: ADD STUDENT NUMBER
        Text("${course.enrollmentCount} طالب",style: Styles.style16(context),),
         RateWidget(rate: course.averageRating ?? 0,),
      ],
    );
  }
}

