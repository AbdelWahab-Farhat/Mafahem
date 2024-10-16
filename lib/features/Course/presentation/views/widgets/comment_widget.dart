import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';


class CommentWidget extends StatelessWidget {
  final Course course;
  const CommentWidget({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بكر بكر',
          style: Styles.style12(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          '2024/9/2',
          style: Styles.style12(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
                (index) => Icon(
              index < 3 ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            ),
          ),
        ),
        const Text(
            'برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. برنامج أساسيات تعلم الآلة مصمم لتقديم أساس قوي ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ المزيد.'),
      ],
    );
  }
}
