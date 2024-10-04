import 'package:Basera/core/utility/functions/validate_functions.dart';
import 'package:Basera/core/widgets/custom_textfield.dart';
import 'package:Basera/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginFieldsSection extends StatelessWidget {
  const LoginFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            validator: validateEmail,
            onSaved: (value) => loginCubit.email = value,
            label: 'البريد الالكتروني',
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            validator: validatePassword,
            onSaved: (value) => loginCubit.password = value,
            label: 'كلمة المرور',
            icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
          ),
        ],
      ),
    );
  }
}