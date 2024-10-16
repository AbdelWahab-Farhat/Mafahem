import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Course/presentation/views/widgets/rate_with_student_number.dart';
import 'package:Basera/features/Course/presentation/views/widgets/title_with_trainer.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Course course;
  const HeaderSection({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWithTrainer(course: course,),
        RateWithStudentNumber(course: course,),
      ],
    );
  }
}
