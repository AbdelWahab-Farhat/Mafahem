import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/date_badge_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/overlay.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/work_shop_item_content.dart';
import 'package:flutter/material.dart';

class WorkShopItem extends StatelessWidget {
  const WorkShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 24),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Image.asset(
            'lib/assets/images/testing-work-shops.jpg',
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
          ),
          const OverlayLayerWidget(),
          const Positioned(
            right: 20,
            bottom: 20,
            child: WorkShopItemContent(),
          ),
          const Positioned(
              top: 10, left: -10, child: DateBadgeWidget(date: '2024-10-9')),
        ],
      ),
    );
  }
}
