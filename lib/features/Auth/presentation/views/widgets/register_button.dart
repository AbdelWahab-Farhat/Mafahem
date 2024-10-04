import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showCustomSnackBar(context, state.successMessage);
        } else if (state is RegisterFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CustomLoadingWidget();
        }
        return CustomFilledButton(
          color: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
            if (registerCubit.formKey.currentState!.validate()) {
              registerCubit.formKey.currentState!.save();
              if (registerCubit.password != registerCubit.confirmPassword) {
                showCustomSnackBar(context, 'كلمة المرور غير متطابقة');
              } else {
                registerCubit.registerUser(
                    registerCubit.userName!,
                    registerCubit.email!,
                    registerCubit.password!,
                    registerCubit.confirmPassword!);
              }
            }
          },
          title: 'أنشاء حساب جديد',
        );
      },
    );
  }
}
