import 'dart:io';

import 'package:Mafaheem/core/enums/image_enum.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG handling
import 'package:shimmer/shimmer.dart';

class CustomAvatarWidget extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final ImageEnum imageEnum;
  final bool hasShadow; // New boolean for optional shadow

  const CustomAvatarWidget({
    this.radius = 37.5,
    this.imageEnum = ImageEnum.network,
    this.imageUrl = 'https://static.vecteezy.com/system/resources/thumbnails/025/337/669/small_2x/default-male-avatar-profile-icon-social-media-chatting-online-user-free-vector.jpg',
    this.hasShadow = false, // Default is no shadow
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasShadow
          ? BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 2), // X, Y offset for the shadow
          ),
        ],
      )
          : null, // No shadow if `hasShadow` is false
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        child: ClipOval(
          child: _getImageWidget(context),
        ),
      ),
    );
  }


  // Method to get image widget based on the imageEnum
  Widget _getImageWidget(BuildContext context) {
    switch (imageEnum) {
      case ImageEnum.network:
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    Theme
                        .of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                    Theme
                        .of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                  ],
                ),
                child: CircleAvatar(
                  radius: radius,
                ),
              ),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          fit: BoxFit.cover,
        );
      case ImageEnum.asset:
        return Image.asset(
          imageUrl,
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          fit: BoxFit.cover,
        );
      case ImageEnum.svg:
        return SvgPicture.network(
          imageUrl,
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          fit: BoxFit.cover,
        );
      case ImageEnum.file:
        return Image.file(
          File(imageUrl),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          fit: BoxFit.cover,
        );
      default:
        return Container(
          color: Colors.grey.shade200,
        );
    }
  }
}