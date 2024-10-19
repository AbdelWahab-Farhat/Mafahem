import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:Mafaheem/core/utility/styles.dart';

class MonthlyWorkShopItem extends StatelessWidget {
  const MonthlyWorkShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'عالم الحاسوب',
                    style: Styles.style16(context)
                        .copyWith(fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                  width: SizeConfig.screenWidth * 0.62,
                  child: Text(
                    'معرفة بكيفية استخدام الحاسوب الأبيض وتوظيفه للمساعدة',
                    style: Styles.style14(context),
                  )),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                  width: SizeConfig.screenWidth * 0.62,
                  child: Text(
                    'تبدأ في 2024/10/30',
                    style: Styles.style14(context).copyWith(fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.secondary),
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
              child: Image.asset(
                'lib/assets/images/course-image.png',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
