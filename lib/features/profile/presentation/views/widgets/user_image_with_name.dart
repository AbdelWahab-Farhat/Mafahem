import 'dart:developer';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/custom_avatar_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class UserImageWithName extends StatelessWidget {
  const UserImageWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tokenCubit = context.read<TokenCubit>();

    return Column(
      children: [
        CustomAvatarWidget(
          radius: 35,
          imageWidget: CachedNetworkImage(
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            imageUrl: tokenCubit.user!.profilePhotoUrl,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
                'lib/assets/images/default-avatar-image.png',
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          tokenCubit.user!.name ?? "User",
          style: Styles.style20(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: GoogleFonts.changa().fontFamily,
          ),
        ),
      ],
    );
  }
}
