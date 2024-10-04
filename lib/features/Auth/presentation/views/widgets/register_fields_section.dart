import 'package:Basera/core/utility/functions/validate_functions.dart';
import 'package:Basera/core/widgets/custom_textfield.dart';
import 'package:Basera/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class RegisterFieldsSection extends StatelessWidget {
  const RegisterFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    return Form(
      key: registerCubit.formKey,
      child: Column(
        children: [
           CustomTextField(
            validator: validateUsername,
            onSaved: (value) => registerCubit.userName = value,
            label: 'اسم المستخدم',
          ),
          const SizedBox(
            height: 24,
          ),
           CustomTextField(
            validator: validateEmail,
            onSaved:  (value) => registerCubit.email = value,
            label: 'البريد الالكتروني',
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            validator: validatePassword,
            onSaved:  (value) => registerCubit.password = value,
            label: 'كلمة المرور',
            icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            validator: validatePassword,
            onSaved:  (value) => registerCubit.confirmPassword = value,
            label: 'تأكيد كلمة المرور',
            icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
          ),
        ],
      ),
    );
  }
}
