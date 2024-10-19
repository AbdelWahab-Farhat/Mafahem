import 'package:Mafaheem/features/Course/presentation/views/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class CourseRatings extends StatelessWidget {
  final List<double> percentageByStar;
  const CourseRatings({super.key, required this.percentageByStar});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        RatingBarWidget(starCount: 5, percentage: percentageByStar[0],),
        const SizedBox(height: 8),
        RatingBarWidget(starCount: 4, percentage: percentageByStar[1],),
        const SizedBox(height: 8),
        RatingBarWidget(starCount: 3, percentage: percentageByStar[2],),
        const SizedBox(height: 8),
        RatingBarWidget(starCount: 2, percentage: percentageByStar[3]),
        const SizedBox(height: 8),
        RatingBarWidget(starCount: 1, percentage: percentageByStar[4],),
      ],
    );
  }
}
