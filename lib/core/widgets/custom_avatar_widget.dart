import 'package:Basera/core/utility/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAvatarWidget extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final bool hasShadow; // New boolean for optional shadow

  const CustomAvatarWidget({
    this.radius = 37.5,
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Shimmer(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.4),
                  Theme.of(context)
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
          ),
        ),
      ),
    );
  }
}
