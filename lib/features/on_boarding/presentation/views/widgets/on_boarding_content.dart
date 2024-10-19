import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String content;
  const OnBoardingContent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style24(context),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.center,
          style: Styles.style14(context),
        ),
      ],
    );
  }
}
