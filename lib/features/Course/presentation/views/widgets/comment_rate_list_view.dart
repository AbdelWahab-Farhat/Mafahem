import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Course/presentation/views/widgets/comment_widget.dart';
import 'package:flutter/material.dart';

class CommentRateListView extends StatelessWidget {
  const CommentRateListView({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    if (course.raters != null || course.raters!.isEmpty) {
      return const SizedBox();
    }
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              CommentWidget(course: course),
              Divider(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                thickness: 0.4,
              ),
            ],
          );
        });
  }
}
