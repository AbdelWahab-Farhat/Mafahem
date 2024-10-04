import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/functions/ui_functions.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/core/widgets/custom_loading_widget.dart';
import 'package:Basera/features/Auth/data/token_service.dart';
import 'package:Basera/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Basera/features/home/presentation/views/home_view.dart';
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
          pushAndRemoveUntil(context, const HomeView());
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
