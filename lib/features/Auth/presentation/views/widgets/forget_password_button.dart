import 'package:flutter/material.dart';

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
        onTap: () {},
        child: Text(
          'نسيت كلمة المرور ؟',
          style: Styles.style12(context).copyWith(decoration: TextDecoration.underline,fontWeight: FontWeight.w600),
      )),
    );
  }
}
