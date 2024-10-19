import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class MostOrderedItemSecondRow extends StatelessWidget {
  const MostOrderedItemSecondRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.only(right: 16,left: 16,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'المدرب :أحمد عمر',
            style: Styles.style14(context)
                .copyWith(fontWeight: FontWeight.w600 ,color: Theme.of(context).colorScheme.tertiary),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(
              '100د.ل',
              style: Styles.style20(context)
                  .copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
