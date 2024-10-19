import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class MostOrderedItemFirstRow extends StatelessWidget {
  const MostOrderedItemFirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'أساسيات علم الاحياء',
            style: Styles.style16(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          CustomFilledButton(
            title: 'أشتري',
            color: Theme.of(context).colorScheme.primary,
            width: 100,
            height: 45,
            radius: 32,
            fontSize: 12,
            textColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
