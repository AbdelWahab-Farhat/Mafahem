import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class AboutCourseTextIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const AboutCourseTextIcon({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style:
          Styles.style16(context).copyWith(fontWeight: FontWeight.normal),
          maxLines: 1,
        ),
      ],
    );
  }
}