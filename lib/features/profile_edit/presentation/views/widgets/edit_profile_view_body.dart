import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:Mafaheem/features/profile_edit/presentation/views/widgets/edit_profile_image_section.dart';
import 'package:Mafaheem/features/profile_edit/presentation/views/widgets/edit_profile_submit_button.dart';
import 'package:Mafaheem/features/profile_edit/presentation/views/widgets/edit_profile_text_field_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditProfileCubit>();
    var cubit2 = GetIt.instance.get<TokenCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'تعديل الحساب'),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditProfileImageSection(cubit: cubit, cubit2: cubit2),
                  ],
                ),
                EditProfileTextFieldSections(cubit: cubit),
                const EditProfileSubmitButton(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                SvgPicture.asset(
                  'lib/assets/icons/logo.svg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



