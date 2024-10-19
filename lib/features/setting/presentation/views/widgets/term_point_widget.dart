import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class TermPointWidget extends StatelessWidget {
  final String title;
  final String description;
  const TermPointWidget(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.style16(context).copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Styles.style14(context),
          ),
        ],
      ),
    );
  }
}
