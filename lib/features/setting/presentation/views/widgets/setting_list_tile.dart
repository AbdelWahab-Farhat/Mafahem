import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final void Function()? onTap;
  const SettingListTile({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      focusColor: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: Styles.style14(context),
      ),
      trailing: trailing,
    );
  }
}
