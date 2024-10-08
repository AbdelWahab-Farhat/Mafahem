import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CustomTagTextWidget extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomTagTextWidget({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: color ?? Theme.of(context).colorScheme.surface,
            width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: Styles.style14(context)
            .copyWith(color: color ?? Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
