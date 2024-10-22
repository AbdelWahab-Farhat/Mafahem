import 'package:flutter/material.dart';

class CustomAvatarWidget extends StatelessWidget {
  final double radius;
  final Widget imageWidget;
  final bool hasShadow; // Optional shadow for the avatar

  const CustomAvatarWidget({
    this.radius = 37.5,
    required this.imageWidget,
    this.hasShadow = false,
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
            offset: const Offset(0, 2),
          ),
        ],
      )
          : null, // No shadow if `hasShadow` is false
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        child: ClipOval(
          child: SizedBox(
            width: radius * 2,
            height: radius * 2,
            child: FittedBox(
              fit: BoxFit.cover, // Ensures the image fills the entire frame
              child: imageWidget,
            ),
          ),
        ),
      ),
    );
  }
}
