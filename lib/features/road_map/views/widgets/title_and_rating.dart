import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';
class TitleAndRating extends StatelessWidget {
  final String title;
  final double rating;

  const TitleAndRating({
    required this.title,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          style: Styles.style16(context).copyWith(
              color: Theme.of(context).colorScheme.surface),
        ),
        Row(
          children: [
            Text(
              rating.toString(),
              style: Styles.style14(context).copyWith(
                  color: Theme.of(context).colorScheme.surface),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.surface,
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}
