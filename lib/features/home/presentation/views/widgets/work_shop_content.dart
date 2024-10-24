import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/work_shops_view.dart';
import 'package:flutter/material.dart';

class WorkShopContent extends StatelessWidget {
  const WorkShopContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ورش عمل اسبوعيا',
          style: Styles.style20(context)
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'انضم لنا لتعلم حرف وعلوم جديدة مجانا',
          style: Styles.style14(context)
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomFilledButton(
          title: 'أشترك',
          width: 150,
          height: 50,
          radius: 32,
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
          onPressed: () => push(context, const WorkShopsView()),
        )
      ],
    );
  }
}
