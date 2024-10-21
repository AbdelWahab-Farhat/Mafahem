import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class GridItemUpperContent extends StatelessWidget {
  final Course course;
  const GridItemUpperContent({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Styles.style16(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'المدرب : ${course.instructorName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
