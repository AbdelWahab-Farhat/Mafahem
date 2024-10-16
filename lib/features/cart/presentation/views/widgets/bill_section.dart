import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:Basera/features/cart/presentation/manager/coupon_cubit/coupon_cubit.dart';
import 'package:Basera/features/cart/presentation/views/widgets/bill_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillSection extends StatelessWidget {
  const BillSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();
    var couponCubit = context.read<CouponCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 0.2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return BlocConsumer<CouponCubit, CouponState>(
            listener: (context, state) {
              if (state is CouponSuccess) {
                showCustomSnackBar(context, state.couponMessage);
              } else if (state is CouponFailure) {
                showCustomSnackBar(context, state.errMessage);
              } else if (state is CouponLoading) {
                showCustomSnackBar(context, 'يرجى الانتظار...');
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  BillWidgetItem(
                    title: 'العدد',
                    trailing:
                        '${cartCubit.numberOfCourses().toString()} كورسات',
                  ),
                  BillWidgetItem(
                    title: 'الخصم',
                    trailing: couponCubit.coupon == null
                        ? '0%'
                        : '${couponCubit.coupon!.discountPercentage}%',
                  ),
                  BillWidgetItem(
                    title: 'السعر الأصلي',
                    trailing: '${cartCubit.totalPrice()} د.ل',
                  ),
                  BillWidgetItem(
                    title: 'الأجمالي',
                    trailing: couponCubit.coupon == null
                        ? '${cartCubit.totalPrice()} د.ل'
                        : '${cartCubit.discountedPrice(double.parse(couponCubit.coupon!.discountPercentage))}د.ل',
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
