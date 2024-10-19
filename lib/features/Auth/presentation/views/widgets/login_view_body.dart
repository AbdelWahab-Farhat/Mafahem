import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/features/Auth/presentation/views/register_view.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/login_button.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/login_fields_section.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/o_auth_section.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/section_divder.dart';
import 'package:Mafaheem/features/Auth/presentation/views/widgets/toggle_auth_views.dart';
import 'package:flutter/material.dart';
import 'forget_password_button.dart';
import 'logo_title.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                        title: 'تسجيل الدخول',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const LoginFieldsSection(),
                      const SizedBox(
                        height: 8,
                      ),
                      const ForgetPasswordButton(),
                      const SizedBox(
                        height: 32,
                      ),
                      const LoginButton(),
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


