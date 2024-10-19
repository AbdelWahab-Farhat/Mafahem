import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/features/Auth/presentation/views/login_view.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/register_button.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/register_fields_section.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/toggle_auth_views.dart';
import 'package:flutter/material.dart';
import 'logo_title.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only( left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(height: 86,),
                  const LogoTitle(
                    title: 'أنشاء حساب جديد',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const RegisterFieldsSection(),
                  const SizedBox(
                    height: 24,
                  ),
                  const RegisterButton(),
                  const SizedBox(
                    height: 9,
                  ),
                  ToggleAuthViews(
                    linkContent: 'تسجيل الدخول',
                    content: 'لديك حساب؟',
                    onTap: () => push(
                      context,
                      const LoginView(),
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
