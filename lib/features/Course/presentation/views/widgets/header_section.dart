import 'package:Basera/features/Course/presentation/views/widgets/rate_with_student_number.dart';
import 'package:Basera/features/Course/presentation/views/widgets/title_with_trainer.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWithTrainer(),
        RateWithStudentNumber(),
      ],
    );
  }
}
