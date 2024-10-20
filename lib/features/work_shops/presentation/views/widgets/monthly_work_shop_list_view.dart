import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/monthly_work_shop_item.dart';
import 'package:flutter/material.dart';

class MonthlyWorkShopListView extends StatelessWidget {
  final List<WorkShop> workShops;
  const MonthlyWorkShopListView({
    super.key, required this.workShops,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: workShops.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: MonthlyWorkShopItem(workShop: workShops[index],),
      ),
    );
  }
}
