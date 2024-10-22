import 'package:Mafaheem/core/utility/functions/validate_functions.dart';
import 'package:Mafaheem/core/widgets/custom_textfield.dart';
import 'package:Mafaheem/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileTextFieldSections extends StatelessWidget {
  const EditProfileTextFieldSections({
    super.key,
    required this.cubit,
  });

  final EditProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'اسم المستخدم',
          validator: validateUsername,
          controller: cubit.controllerUserName,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: 'كلمة المرور',
          validator: validatePassword,
          controller: cubit.controllerUserPassword,
          icon: const Icon(
            FontAwesomeIcons.eyeSlash,
            size: 17,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          label: 'تأكيد كلمة المرور',
          validator: (value) {
            if (value != cubit.controllerUserPassword.text) {
              return "كلمة المرور غير متطابقة";
            }
            return null;
          },
          controller: cubit.controllerUserConfirmPassword,
          icon: const Icon(
            FontAwesomeIcons.eyeSlash,
            size: 17,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
