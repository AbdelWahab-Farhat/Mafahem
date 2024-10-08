import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'فيزياء',
          style: Styles.style14(context).copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.surface),
        ),
        Text(
          '14 كورس',
          style: Styles.style12(context).copyWith(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.8)),
        )
      ],
    );
  }
}
