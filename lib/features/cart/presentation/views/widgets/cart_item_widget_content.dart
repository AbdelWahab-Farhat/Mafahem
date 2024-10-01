import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CartItemWidgetContent extends StatelessWidget {
  const CartItemWidgetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: Text(
              "الكيمياء حيوية",
              style: Styles.style16(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: Text(
            'المحاضر:عزيز احمد',
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
