import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartItemWidgetPriceWithRemove extends StatelessWidget {
  final Course course;
  const CartItemWidgetPriceWithRemove({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFilledButton(
            title: 'ازالة',
            fontSize: 16,
            height: 40,
            width: 100,
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            radius: 42,
            onPressed: () => context.read<CartCubit>().removeFromCart(course.id.toString()),
          ),
          const Spacer(),
          Text(
            "${course.price}د.ل",
            style: Styles.style18(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
