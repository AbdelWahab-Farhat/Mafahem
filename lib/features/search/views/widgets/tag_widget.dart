import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String title;
  final Color color;

  const TagWidget({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
          width: 1.5,
        ),
      ),
      child: Text(
        title,
        style: Styles.style14(context).copyWith(color: color,fontWeight: FontWeight.bold),
      ),
    );
  }
}
