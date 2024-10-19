import 'package:Mafaheem/core/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LogoTitle extends StatelessWidget {
  final String title;
  const LogoTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'lib/assets/icons/logo.svg',
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
