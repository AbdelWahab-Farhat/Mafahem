import 'package:Basera/features/cart/presentation/views/widgets/bill_widget_item.dart';
import 'package:flutter/material.dart';

class BillSection extends StatelessWidget {
  const BillSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 0.2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        children: [
          BillWidgetItem(
            title: 'العدد',
            trailing: '3 كورسات',
          ),
          BillWidgetItem(
            title: 'الخصم',
            trailing: '0 د.ل',
          ),
          BillWidgetItem(
            title: 'السعر الأصلي',
            trailing: '100 د.ل',
          ),
          BillWidgetItem(
            title: 'الأجمالي',
            trailing: '100 د.ل',
          ),
        ],
      ),
    );
  }
}
