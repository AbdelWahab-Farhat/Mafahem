import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool hasMore;
  const SectionTitle({
    super.key, required this.title,
    this.hasMore = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hasMore ? 20 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.style16(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          if (hasMore)
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
