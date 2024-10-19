import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/rater.dart';
import 'package:Mafaheem/core/models/review.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';


class CommentWidget extends StatelessWidget {
  final Course course;
  final Rater rater;
  final Review review;
  const CommentWidget({
    super.key, required this.course, required this.rater, required this.review,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rater.name,
          style: Styles.style12(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          "${rater.pivot.createdAt.year}/${rater.pivot.createdAt.month}/${rater.pivot.createdAt.day}",
          style: Styles.style12(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
                (index) => Icon(
              index <rater.pivot.rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            ),
          ),
        ),
        Text(review.review,style: Styles.style14(context),),
      ],
    );
  }
}
