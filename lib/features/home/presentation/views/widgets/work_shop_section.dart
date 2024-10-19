import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/work_shop_content.dart';
import 'package:flutter/material.dart';

class WorkShopsSection extends StatelessWidget {
  const WorkShopsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WorkShopContent(),
          AspectRatio(
              aspectRatio: 2 / 4,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                      'lib/assets/images/workshops-image.png'))),
        ],
      ),
    );
  }
}
