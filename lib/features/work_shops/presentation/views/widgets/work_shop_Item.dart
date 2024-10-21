import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/date_badge_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/overlay.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/work_shop_item_content.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shop_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class WorkShopItem extends StatelessWidget {
  final WorkShop workShopCoverItem;
  const WorkShopItem({
    super.key, required this.workShopCoverItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(context, WorkShopDetailView(workShop: workShopCoverItem),pageTransitionType: PageTransitionType.rightToLeft),
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(bottom: 24),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(imageUrl: workShopCoverItem.image!,
            placeholder: (context, url) => Shimmer(
              gradient: Styles.customLinerGradient(context),
              child: const SizedBox(
              ),
            ),
            ),
            const OverlayLayerWidget(),
             Positioned(
              right: 20,
              bottom: 20,
              child: WorkShopItemContent(workShop: workShopCoverItem,),
            ),
             Positioned(
                top: 10, left: -10, child: DateBadgeWidget(date: workShopCoverItem.date)),
          ],
        ),
      ),
    );
  }
}
