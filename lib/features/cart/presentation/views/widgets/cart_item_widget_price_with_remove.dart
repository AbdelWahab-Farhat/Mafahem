import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';


class CartItemWidgetPriceWithRemove extends StatelessWidget {
  const CartItemWidgetPriceWithRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomFilledButton(
            title: 'ازالة',
            fontSize: 16,
            height: 34,
            width: 100,
            color: Theme.of(context).colorScheme.onSurface,
            textColor: Theme.of(context).colorScheme.onPrimary,
            radius: 42,
          ),
          const Spacer(),
          Text(
            "90.40د.ل",
            style: Styles.style20(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
