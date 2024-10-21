import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class GridItemLowerContent extends StatelessWidget {
  final Course course;
  const GridItemLowerContent({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            course.level,
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            '${course.price} د.ل',
            style: Styles.style16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
