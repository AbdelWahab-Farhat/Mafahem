import 'package:Basera/features/profile/presentation/views/widgets/profile_card_content.dart';
import 'package:flutter/material.dart';

class ProfileCardUpperRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const ProfileCardUpperRow({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileCardContent(
          title: title,
          subTitle: subTitle,
        ),
        Container(
            width: 147,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
