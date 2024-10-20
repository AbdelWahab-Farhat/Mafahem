import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/register_on_work_shop_cubit/register_on_work_shop_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SignNowButton extends StatelessWidget {
  const SignNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterOnWorkShopCubit>();
    return Center(
      child: BlocConsumer<RegisterOnWorkShopCubit, RegisterOnWorkShopState>(
        listener: (context, state) {
          if (state is RegisterOnWorkShopSuccess) {
            showCustomSnackBar(context, state.successMessage);
          } else if (state is RegisterOnWorkShopFailure) {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is RegisterOnWorkShopLoading) {
            return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: SizeConfig.screenWidth * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16)
                  ),
                ));
          }
          return GestureDetector(
            onTap: cubit.isUserRegistered
                ? () => showCustomSnackBar(context, 'تم التسجيل بالفعل ياعزيزي')
                : () => cubit.registerOnWorkShop(),
            child: CustomFilledButton(
              title: cubit.isUserRegistered ? 'تم التسجيل' : 'أحجز الان',
              textColor: Theme.of(context).colorScheme.onPrimary,
            ),
          );
        },
      ),
    );
  }
}
