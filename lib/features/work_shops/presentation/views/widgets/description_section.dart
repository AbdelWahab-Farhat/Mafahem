import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String description;
  const DescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الوصف',
          style: Styles.style18(context),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Styles.style14(context),
        ),
      ],
    );
  }
}

