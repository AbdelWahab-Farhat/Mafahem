import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';
class SubtitleAndPrice extends StatelessWidget {
  final String subtitle;
  final String price;

  const SubtitleAndPrice({
    required this.subtitle,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                subtitle,
                style: Styles.style14(context).copyWith(
                    color: Theme.of(context).colorScheme.surface),
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.book,
              color: Theme.of(context).colorScheme.surface,
              size: 14,
            ),
          ],
        ),
        Text(
          price,
          style: Styles.style14(context).copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
