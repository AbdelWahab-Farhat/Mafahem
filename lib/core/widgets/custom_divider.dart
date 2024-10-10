import 'package:flutter/material.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.onSurface,
      thickness: 0.2,
      height: 0.4,
    );
  }
}