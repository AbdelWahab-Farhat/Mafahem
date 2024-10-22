import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/most_ordered_item_first_row.dart';
import 'package:Mafaheem/features/home/presentation/views/widgets/most_ordered_item_second_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MostOrderedItem extends StatelessWidget {
  final Course course;

  const MostOrderedItem({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 32, left: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: course.image,
            height: SizeConfig.screenHeight * 0.2,
            width: SizeConfig.screenWidth,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: const SizedBox(
                  width: 200,
                  height: 100,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          MostOrderedItemFirstRow(
            course: course,
          ),
          const Spacer(),
          MostOrderedItemSecondRow(
            course: course,
          )
        ],
      ),
    );
  }
}
