import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class GridItemUpperContent extends StatelessWidget {
  const GridItemUpperContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تعلم جافا سكريبت',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Styles.style16(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'المدرب : يوسف مراعش',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
