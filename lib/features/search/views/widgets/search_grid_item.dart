import 'package:Mafaheem/features/search/views/widgets/search_grid_item_lower_content.dart';
import 'package:Mafaheem/features/search/views/widgets/search_grid_item_upper_content.dart';
import 'package:Mafaheem/features/search/views/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class SearchGridItem extends StatelessWidget {
  final int index;
  const SearchGridItem({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use Flexible to fit the available space
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(
              'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GridItemUpperContent(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GridItemLowerContent(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          ),
          const SizedBox(height: 14),
           Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              runSpacing: 8,
              spacing: 8,
              children: [
                TagWidget(title: 'ثانوي', color: Colors.blue),
               TagWidget(title: 'برمجة', color: Colors.red),
               TagWidget(title: 'برمجة', color: Colors.red),
                TagWidget(title: 'برمجة', color: Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
