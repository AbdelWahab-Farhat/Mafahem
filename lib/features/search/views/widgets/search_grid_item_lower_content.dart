import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class GridItemLowerContent extends StatelessWidget {
  const GridItemLowerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'للمبتدئين',
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            '20 د.ل',
            style: Styles.style16(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
