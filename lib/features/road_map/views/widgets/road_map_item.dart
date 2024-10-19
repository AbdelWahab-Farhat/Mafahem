import 'dart:developer';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/road_map/data/calculate_road_map_service.dart';
import 'package:Mafaheem/features/road_map/views/road_map_courses_view.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_item_details.dart';
import 'package:Mafaheem/features/work_shops/presentation/views/widgets/overlay.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoadMapItem extends StatelessWidget {
  final RoadMap roadMap;

  const RoadMapItem({
    super.key,
    required this.roadMap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(context, RoadMapCoursesView(courses: roadMap.courses,)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: SizeConfig.screenWidth,
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: roadMap.courses[0].image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) {
                log('Error loading image: $error');
                return const Icon(Icons.error);
              },
              fit: BoxFit.cover,
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
            ),
            const OverlayLayerWidget(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RoadMapItemDetails(
                title: roadMap.title,
                rating: 4.3,
                subtitle: roadMap.description,
                price: "${CalculateRoadMapService.calculateLearnPath(roadMap).toStringAsFixed(1)} د.ل",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
