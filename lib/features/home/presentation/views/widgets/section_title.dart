import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.style16(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'المزيد...',
            style: Styles.style14(context)
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          )
        ],
      ),
    );
  }
}
