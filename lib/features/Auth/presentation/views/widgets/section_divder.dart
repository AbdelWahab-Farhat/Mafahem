import 'package:flutter/material.dart';

import '../../../../../core/utility/styles.dart';
class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        children: [
           Expanded(child: Divider(color: Theme.of(context).colorScheme.tertiary,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('أو', style: Styles.style14(context)),
          ),
           Expanded(child: Divider(color: Theme.of(context).colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
