import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class BillWidgetItem extends StatelessWidget {
  final String title;
  final String trailing;
  const BillWidgetItem({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Styles.style16(context).copyWith(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
        ),
      ),
      trailing: Text(trailing,
          style: Styles.style16(context).copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
