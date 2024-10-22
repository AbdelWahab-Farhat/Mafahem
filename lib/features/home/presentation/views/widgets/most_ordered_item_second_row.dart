import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class MostOrderedItemSecondRow extends StatelessWidget {
  final Course course;

  const MostOrderedItemSecondRow({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'المدرب :${course.instructorName}',
            style: Styles.style14(context).copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.tertiary),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(
              '${course.price}د.ل',
              style: Styles.style20(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
