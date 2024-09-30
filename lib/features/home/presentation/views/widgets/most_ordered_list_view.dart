import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/home/presentation/views/widgets/most_ordered_item.dart';
import 'package:flutter/material.dart';

class MostOrderedListView extends StatelessWidget {
  const MostOrderedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            padding: const EdgeInsets.only(right: 20, top: 16),
            itemBuilder: (context, index) {
              return SizedBox(
                width: constraints.maxWidth * 0.9,
                child: const MostOrderedItem(),
              );
            },
          );
        },
      ),
    );
  }
}
