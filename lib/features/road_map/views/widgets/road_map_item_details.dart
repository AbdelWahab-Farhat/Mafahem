import 'package:Basera/features/learning_path/views/widgets/subtitle_and_Price.dart';
import 'package:Basera/features/learning_path/views/widgets/title_and_rating.dart';
import 'package:flutter/material.dart';
class RoadMapItemDetails extends StatelessWidget {
  final String title;
  final double rating;
  final String subtitle;
  final String price;

  const RoadMapItemDetails({
    required this.title,
    required this.rating,
    required this.subtitle,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAndRating(title: title, rating: rating),
          const SizedBox(height: 8),
          SubtitleAndPrice(subtitle: subtitle, price: price),
        ],
      ),
    );
  }
}
