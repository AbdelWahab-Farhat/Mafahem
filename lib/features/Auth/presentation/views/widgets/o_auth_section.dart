import 'package:Mafaheem/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class OAuthSection extends StatelessWidget {
  const OAuthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          color: Theme.of(context).colorScheme.onPrimary,
          title: 'تسجيل الدخول عن طريق جوجل',
          icon: SvgPicture.asset('lib/assets/icons/google.svg'),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomIconButton(
          color: Theme.of(context).colorScheme.onPrimary,
          title: 'تسجيل الدخول عن طريق فيسبوك',
          icon: SvgPicture.asset('lib/assets/icons/facebook.svg'),
        ),
      ],
    );
  }
}
