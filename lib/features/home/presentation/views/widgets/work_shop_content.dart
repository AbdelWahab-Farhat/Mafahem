import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
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
          style: Styles.style20(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'انضم لنا لتعلم حرف وعلوم جديدة مجانا',
          style: Styles.style14(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 16,),
        CustomFilledButton(title: 'أشترك',width: 150,height: 50,radius: 32,color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w600,)
      ],
    );
  }
}
