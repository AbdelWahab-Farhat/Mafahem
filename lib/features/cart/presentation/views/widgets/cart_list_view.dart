import 'package:Basera/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        var cartCubit = context.read<CartCubit>();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartCubit.cart!.courses!.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                course: cartCubit.cart!.courses![index],
              );
            },
    );
  }
}
