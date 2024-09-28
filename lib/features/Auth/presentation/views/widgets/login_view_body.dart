import 'package:Basera/core/utility/helper.dart';
import 'package:Basera/features/Auth/presentation/views/register_view.dart';
import 'package:Basera/features/Auth/presentation/views/widgets/o_auth_section.dart';
import 'package:Basera/features/Auth/presentation/views/widgets/section_divder.dart';
import 'package:Basera/features/Auth/presentation/views/widgets/toggle_auth_views.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import 'forget_password_button.dart';
import 'logo_title.dart';
import 'package:flutter_svg/svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 86, left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  const LogoTitle(
                    title: 'تسجيل الدخول',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CustomTextField(
                    label: 'البريد الالكتروني',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    label: 'كلمة المرور',
                    icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const ForgetPasswordButton(),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomFilledButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                    title: 'تسجيل الدخول',
                  ),
                  const SectionDivider(),
                  const OAuthSection(),
                  const SizedBox(
                    height: 8,
                  ),
                  ToggleAuthViews(
                    linkContent: 'أنشاء حساب',
                    content: 'ليس لديك حساب؟',
                    onTap: () => push(
                      context,
                      const RegisterView(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


