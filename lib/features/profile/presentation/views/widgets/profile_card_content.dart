import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:flutter/material.dart';

class ProfileCardContent extends StatelessWidget {
  final String title;
  final String subTitle;
  const ProfileCardContent({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.50,
            child: Text(
              title,
              maxLines: 2,
              style: Styles.style16(context).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.50,
            child: Text(
              subTitle,
              style: Styles.style14(context)
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
