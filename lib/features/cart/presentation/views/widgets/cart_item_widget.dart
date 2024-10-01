import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget_content.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget_price_with_remove.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              const CartItemWidgetContent(),
              const Spacer(),
              Container(
                width: 147,
                height: 100,
                clipBehavior: Clip.hardEdge,
                constraints: const BoxConstraints(
                  maxWidth: 147,
                  maxHeight: 100,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 3),
                      blurRadius: 4, // ضبابية الظل (Blur = 4)
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.asset(
                    'lib/assets/images/Roadmap-to-Learn-JavaScript-For-Beginners 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const CartItemWidgetPriceWithRemove(),
        Divider(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),),
      ],
    );
  }
}
