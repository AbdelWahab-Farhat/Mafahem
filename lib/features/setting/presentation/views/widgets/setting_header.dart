import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_avatar_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    super.key,
    required this.cubit,
  });

  final TokenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAvatarWidget(
          radius: 20,
          hasShadow: true,
          imageWidget: CachedNetworkImage(
            imageUrl: cubit.user!.profilePhotoUrl,
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'lib/assets/images/default-avatar-image.png',
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          cubit.user!.name ?? "",
          style: Styles.style16(context).copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.changa().fontFamily,
          ),
        ),
      ],
    );
  }
}
