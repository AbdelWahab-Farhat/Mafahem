import 'package:Basera/features/profile/presentation/views/widgets/profile_card_lower_row.dart';
import 'package:Basera/features/profile/presentation/views/widgets/profile_card_upper_row.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Widget? leftWidget;
  final Widget? rightWidget;
  const ProfileCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.leftWidget,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCardUpperRow(
          title: title,
          subTitle: subTitle,
          image: image,
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileCardLowerRow(
          leftWidget: leftWidget,
          rightWidget: rightWidget,
        ),
        Divider(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        ),
      ],
    );
  }
}
