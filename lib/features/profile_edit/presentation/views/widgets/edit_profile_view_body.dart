import 'package:Basera/core/enums/image_enum.dart';
import 'package:Basera/core/utility/functions/validate_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/widgets/custom_app_bar.dart';
import 'package:Basera/core/widgets/custom_avatar_widget.dart';
import 'package:Basera/core/widgets/custom_filled_button.dart';
import 'package:Basera/core/widgets/custom_textfield.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Basera/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<EditProfileCubit, EditProfileState>(
                    builder: (context, state) {
                      return ClipOval(
                        // Clipping the entire stack to keep it circular
                        child: GestureDetector(
                          onTap: () => cubit.changeUserImage(),
                          child: Stack(
                            children: [
                               CustomAvatarWidget(
                                imageEnum: cubit.imagePath == "" ? ImageEnum.network : ImageEnum.file,
                                radius: 50,
                                 imageUrl: cubit.imagePath == "" ?  cubit2.user!.data.profilePhotoUrl : cubit.imagePath,
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.2),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.camera,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
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
              CustomFilledButton(
                title: 'تأكيد',
                textColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                },
              ),
              const Spacer(),
              SvgPicture.asset(
                'lib/assets/icons/logo.svg',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
