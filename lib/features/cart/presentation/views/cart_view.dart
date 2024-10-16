import 'package:Basera/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:Basera/features/cart/presentation/manager/coupon_cubit/coupon_cubit.dart';
import 'package:Basera/features/cart/presentation/manager/scroll_cubit/scroll_cubit.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScrollCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => CouponCubit(),
        )
      ],
      child: const CartViewBody(),
    );
  }
}
