import 'package:Basera/features/setting/presentation/views/widgets/setting_list_tile.dart';
import 'package:flutter/material.dart';

class MoreSection extends StatelessWidget {
  const MoreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingListTile(
          title: 'سياسة الخصوصية',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
        ),
        SettingListTile(
          title: 'اشترك في البريميوم',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
        ),
        SettingListTile(
          title: 'كن من طاقمنا التعليمي',
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
        ),
      ],
    );
  }
}
