import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';
class MiniSection extends StatelessWidget {
  final String title;
  final String content;
  const MiniSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.style18(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          content,
          style: Styles.style14(context),
        ),
      ],
    );
  }
}
