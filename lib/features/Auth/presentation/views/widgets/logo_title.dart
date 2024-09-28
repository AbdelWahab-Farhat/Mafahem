import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';


class LogoTitle extends StatelessWidget {
  final String title;
  const LogoTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'lib/assets/images/logo-test.png',
          width: 94.95,
          height: 59.92,
        ),
        const SizedBox(height: 24,),
        Text(
          title,
          style: Styles.style32(context)),
      ],
    );
  }
}
