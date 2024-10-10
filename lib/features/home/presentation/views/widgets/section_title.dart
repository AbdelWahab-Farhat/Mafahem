import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Styles.style16(context)
              .copyWith(fontWeight: FontWeight.w600 , color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
