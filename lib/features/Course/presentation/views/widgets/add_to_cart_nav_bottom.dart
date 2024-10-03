import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class AddToCartNavBottom extends StatelessWidget {
  const AddToCartNavBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFilledButton(
          width: SizeConfig.screenWidth * 0.75,
          title: 'اضافة للسلة',
          onPressed: () {},
          radius: 0,
          color: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('100 د.ل',style: Styles.style18(context),),
            // TODO: PRICE BEFORE DISCOUNT ( DO IT LATER)
            if (false) Text('100 د.ل',style: Styles.style16(context).copyWith(decoration:  TextDecoration.lineThrough),),

          ],
        ),
        SizedBox(width:SizeConfig.screenWidth * 0.01,),
      ],
    );
  }
}
