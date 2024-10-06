import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/features/Auth/presentation/views/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/utility/styles.dart';
class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: ()=>push(context, const ForgetPasswordView() , pageTransitionType: PageTransitionType.rightToLeft),
        child: Text(
          'نسيت كلمة المرور ؟',
          style: Styles.style12(context).copyWith(decoration: TextDecoration.underline,fontWeight: FontWeight.w600),
      )),
    );
  }
}
