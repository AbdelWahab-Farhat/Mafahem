import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double percentage;

  const RatingBar({
    super.key,
    required this.starCount,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // النسبة المئوية على اليمين
        Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(width: 10),
        Row(
          children: List.generate(
            5,
                (index) => Icon(
              index < starCount
                  ? Icons.star
                  : Icons.star_border,
              color: Colors.amber,
              size: 16,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ],
    );
  }
}
