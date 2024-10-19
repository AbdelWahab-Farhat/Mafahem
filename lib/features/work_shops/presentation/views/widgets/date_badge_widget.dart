import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class DateBadgeWidget extends StatelessWidget {
  final String date;

  const DateBadgeWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8)), // تدوير الحواف
      ),
      child: Text(
        date,
        style: Styles.style16(context)
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
