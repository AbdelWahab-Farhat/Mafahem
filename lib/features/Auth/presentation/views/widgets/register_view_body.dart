import 'package:Basera/core/utility/helper.dart';
import 'package:Basera/features/Auth/presentation/views/login_view.dart';
import 'package:Basera/features/Auth/presentation/views/widgets/toggle_auth_views.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import 'logo_title.dart';
import 'package:flutter_svg/svg.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
                    title: 'أنشاء حساب جديد',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomTextField(
                    label: 'اسم المستخدم',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomTextField(
                    label: 'البريد الالكتروني',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    label: 'كلمة المرور',
                    icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    label: 'تأكيد كلمة المرور',
                    icon: SvgPicture.asset('lib/assets/icons/eye-off.svg'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFilledButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: (){},
                    title: 'أنشاء حساب جديد',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  ToggleAuthViews(linkContent: 'تسجيل الدخول', content: 'لديك حساب؟',onTap: () => push(context, const LoginView(), ),),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



