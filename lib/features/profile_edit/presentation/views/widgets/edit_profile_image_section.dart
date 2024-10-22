import 'dart:io';

import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_avatar_widget.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/profile_edit/presentation/manager/edit_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileImageSection extends StatelessWidget {
  const EditProfileImageSection({
    super.key,
    required this.cubit,
    required this.cubit2,
  });

  final EditProfileCubit cubit;
  final TokenCubit cubit2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return ClipOval(
          // Clipping the entire stack to keep it circular
          child: GestureDetector(
            onTap: () => cubit.changeUserImage(),
            child: Stack(
              children: [
                CustomAvatarWidget(
                  radius: 50,
                  imageWidget: cubit.imagePath == ""
                      ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight,
                    imageUrl:
                    cubit2.user!.profilePhotoUrl,
                    placeholder: (context, url) =>
                        Shimmer.fromColors(
                            baseColor:
                            Colors.grey.shade300,
                            highlightColor:
                            Colors.grey.shade100,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey.shade300,
                            )),
                    errorWidget: (context, url, error) =>
                        Image.asset(
                          'lib/assets/images/default-avatar-image.png',
                          fit: BoxFit.cover,
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight,
                        ),
                  )
                      : Image.file(File(cubit.imagePath)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                    ),
                    child: Icon(
                      FontAwesomeIcons.camera,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
