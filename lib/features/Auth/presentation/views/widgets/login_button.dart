import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/functions/ui_functions.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showCustomSnackBar(context, state.successMessage);
          context.read<TokenCubit>().user = cubit.user;
          pushAndRemoveUntil(context, const RootView());
        }
        if (state is LoginFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CustomLoadingWidget(),
          );
        }
        return CustomFilledButton(
          color: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
            if (cubit.formKey.currentState!.validate())  {
              cubit.formKey.currentState!.save();
              cubit.loginUser(cubit.email!, cubit.password!);
              context.read<TokenCubit>().user = cubit.user;
            }
          },
          title: 'تسجيل الدخول',
        );
      },
    );
  }
}
