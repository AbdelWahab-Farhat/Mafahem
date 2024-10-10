import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/features/setting/presentation/views/terms_and_conditions_view.dart';
import 'package:Basera/features/setting/presentation/views/widgets/setting_list_tile.dart';
import 'package:flutter/material.dart';

class MoreSection extends StatelessWidget {
  const MoreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingListTile(
          onTap: () => push(context, TermsAndConditionsView()),
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
