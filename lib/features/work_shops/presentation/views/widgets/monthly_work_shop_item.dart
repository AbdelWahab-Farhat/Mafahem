import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shop_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class MonthlyWorkShopItem extends StatelessWidget {
  final WorkShop workShop;

  const MonthlyWorkShopItem({
    super.key,
    required this.workShop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(context, WorkShopDetailView(workShop: workShop),
          pageTransitionType: PageTransitionType.rightToLeft),
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2), // ظل خفيف
              blurRadius: 4,
              offset: const Offset(0, 2), // تحديد اتجاه الظل
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: SizeConfig.screenWidth * 0.62,
                    child: Text(
                      workShop.title,
                      style: Styles.style16(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                    width: SizeConfig.screenWidth * 0.62,
                    child: Text(
                      workShop.description,
                      style: Styles.style14(context),
                    )),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                    width: SizeConfig.screenWidth * 0.62,
                    child: Text(
                      workShop.date,
                      style: Styles.style14(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    )),
              ],
            ),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 85,
                height: 85,
                child: CachedNetworkImage(
                  imageUrl: workShop.image!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer(
                      gradient: Styles.customLinerGradient(context),
                      child: const SizedBox(
                        width: 85,
                        height: 85,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
