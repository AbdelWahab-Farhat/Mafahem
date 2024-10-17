import 'dart:developer';

import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/widgets/custom_divider.dart';
import 'package:Basera/features/Course/data/get_course_by_id.dart';
import 'package:Basera/features/Course/presentation/views/course_view.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget_content.dart';
import 'package:Basera/features/cart/presentation/views/widgets/cart_item_widget_price_with_remove.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartItemWidget extends StatelessWidget {
  final Course course;
  const CartItemWidget({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var result  = await GetCourseByIdService.getCourseById(course.id.toString());
        result.fold((l){}, (r) {
          pushReplacement(context,
            CourseView(course: r));
        },);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CartItemWidgetContent(
                  instructionName: course.instructorName,
                  title: course.title,
                ),
                const Spacer(),
                Container(
                  width: 147,
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  constraints: const BoxConstraints(
                    maxWidth: 147,
                    maxHeight: 100,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: CachedNetworkImage(
                      imageUrl: course.image,
                      placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Theme.of(context).colorScheme.secondary,
                          highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                          child: Container()),
                      // TODO LATER ADD ERROR IMAGE (SAYING NO IMAGE)
                      errorWidget: (context, url, error) => Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
           CartItemWidgetPriceWithRemove(course: course,),
          const SizedBox(height: 8),
          const CustomDivider(),
        ],
      ),
    );
  }
}
