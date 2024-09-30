import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/home/presentation/views/widgets/most_ordered_item_first_row.dart';
import 'package:Basera/features/home/presentation/views/widgets/most_ordered_item_second_row.dart';
import 'package:flutter/material.dart';

class MostOrderedItem extends StatelessWidget {
  const MostOrderedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 32, left: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/images/course-image.png',
            width: SizeConfig.screenWidth * 0.9,
            height: 140,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10,),
          const MostOrderedItemFirstRow(),
          const Spacer(),
          const MostOrderedItemSecondRow()
        ],
      ),
    );
  }
}
