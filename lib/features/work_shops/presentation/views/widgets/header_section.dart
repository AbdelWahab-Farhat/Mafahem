import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HeaderSection extends StatelessWidget {
  final WorkShop workShop;
  const HeaderSection({super.key, required this.workShop});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image with a gradient overlay
        Container(
          height: SizeConfig.screenWidth * 0.7,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image:  DecorationImage(
              image: CachedNetworkImageProvider(
                  workShop.image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Gradient overlay
        Container(
          height: SizeConfig.screenWidth * 0.7,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.0), // Start with transparent
                Colors.black.withOpacity(0.6), // Fade to black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // Back button
        Positioned(
          left: 12,
          top: 12,
          child: IconButton(
            icon: CircleAvatar(
                radius: 17,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(FontAwesomeIcons.arrowLeft,
                    color: Theme.of(context).colorScheme.onPrimary, size: 20)),
            onPressed: () {},
          ),
        ),

        // Text content
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workShop.title,
                  style: Styles.style18(context).copyWith(
                    color: Colors.white, // Make the text white for readability
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'ليبيا, طرابلس - وسعاية الفاتح',
                    style: Styles.style16(context).copyWith(
                      color: Colors.white, // White text for readability
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // TODO : FORMAT THEM LATER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التاريخ : ${workShop.date}',
                    style: Styles.style14(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'الوقت : ${workShop.time} مسائا',
                    style: Styles.style14(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
