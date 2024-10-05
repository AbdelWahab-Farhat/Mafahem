import 'package:flutter/material.dart';

class ProfileCardLowerRow extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? rightWidget;
  const ProfileCardLowerRow({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        leftWidget ?? const SizedBox(),
        rightWidget ?? const SizedBox(),
      ],
    );
  }
}
