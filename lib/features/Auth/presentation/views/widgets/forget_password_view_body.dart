import 'package:Basera/core/utility/functions/validate_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_textfield.dart';
import 'package:Basera/features/Auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:Basera/features/Auth/presentation/views/widgets/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: forgetPasswordCubit.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 84,
              ),
              SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: Image.asset(
                    'lib/assets/images/Reset-password.png',
                    height: 300,
                  )),
              Text(
                'الرجاء أدخال بريدك الالكتروني',
                style: Styles.style18(context),
              ),
              const SizedBox(
                height: 16,
              ),
               CustomTextField(
                validator: validateEmail,
                onSaved: (value) => forgetPasswordCubit.email = value!,
              ),
              const SizedBox(
                height: 32,
              ),
              const ResetPasswordButton()
            ],
          ),
        ),
      ),
    );
  }
}



