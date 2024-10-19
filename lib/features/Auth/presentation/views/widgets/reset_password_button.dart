import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          showCustomDialog(
              context: context,
              title: 'تم الأرسال',
              description:
                  'قم بالتحقق من بريدك الالكتروني لاعادة تعيين كلمة المرور',
              image: 'lib/assets/animation/sent-email-animation.json',
          onConfirm:()=>pop(context)
          );
        } else if (state is ForgetPasswordFailure) {
          showCustomDialog(
              context: context,
              title: 'خطأ',
              description: state.errMessage,
              onConfirm:()=>pop(context),
              image: 'lib/assets/animation/error-animation.json');
        }
      },
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const CustomLoadingWidget();
        }
        var forgetPasswordCubit = context.read<ForgetPasswordCubit>();
        return CustomFilledButton(
          title: 'أرسال',
          color: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
            if (forgetPasswordCubit.formKey.currentState!.validate()) {
              forgetPasswordCubit.formKey.currentState!.save();
              forgetPasswordCubit.sendRestPasswordOnEmail();
            }
          },
        );
      },
    );
  }
}
