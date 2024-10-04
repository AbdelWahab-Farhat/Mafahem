import 'package:Basera/features/work_shops/presentation/views/widgets/monthly_work_shop_item.dart';
import 'package:flutter/material.dart';

class MonthlyWorkShopListView extends StatelessWidget {
  const MonthlyWorkShopListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MonthlyWorkShopItem(),
        SizedBox(
          height: 8,
        ),
        MonthlyWorkShopItem(),
        SizedBox(
          height: 8,
        ),
        MonthlyWorkShopItem(),
        SizedBox(
          height: 8,
        ),
        MonthlyWorkShopItem(),
      ],
    );
  }
}
