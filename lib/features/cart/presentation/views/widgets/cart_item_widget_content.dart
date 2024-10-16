import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class CartItemWidgetContent extends StatelessWidget {
  final String title;
  final String instructionName;
  const CartItemWidgetContent({
    super.key, required this.title, required this.instructionName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: Text(
            title,
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
            'المدرب:${instructionName}',
            style: Styles.style14(context).copyWith(
                color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
