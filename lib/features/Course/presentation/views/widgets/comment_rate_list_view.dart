import 'dart:developer';

import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/rater.dart';
import 'package:Mafaheem/core/models/review.dart';
import 'package:Mafaheem/features/Course/data/get_full_review.dart';
import 'package:Mafaheem/features/Course/presentation/manager/comment_cubit/comment_cubit.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentRateListView extends StatelessWidget {
  const CommentRateListView({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    if (course.raters == null || course.raters!.isEmpty) {
      return const SizedBox();
    }
    List<Rater> raters = course.raters ?? [];
    List<Review> reviews = course.reviews ?? [];
    var mapOfFullReview = GetFullReview.getUserFullReview(reviews, raters);
    log(reviews.length.toString());
    log(raters.length.toString());
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is CommentFailure) {}
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mapOfFullReview.length <= 4 ? mapOfFullReview.length : 4,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  CommentWidget(
                    course: course,
                    rater: raters[index],
                    review: reviews[index],
                  ),
                  Divider(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.2),
                    thickness: 0.4,
                  ),
                ],
              );
            });
      },
    );
  }
}
