import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/work_shops/presentation/manager/register_on_work_shop_cubit/register_on_work_shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignNowButton extends StatelessWidget {
  const SignNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<RegisterOnWorkShopCubit, RegisterOnWorkShopState>(
        listener: (context, state) {
          if (state is RegisterOnWorkShopSuccess) {
            showCustomSnackBar(context, state.successMessage);
          }
          else if (state is RegisterOnWorkShopFailure) {
            showCustomSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is RegisterOnWorkShopLoading) {
            return const CustomLoadingWidget();
          }
          return GestureDetector(
            onTap: () => context.read<RegisterOnWorkShopCubit>().registerOnWorkShop(),
            child: CustomFilledButton(
              title: 'أحجز الان',
              textColor: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
            ),
          );
        },
      ),
    );
  }
}
