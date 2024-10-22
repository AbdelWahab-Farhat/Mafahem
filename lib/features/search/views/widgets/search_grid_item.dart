import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/features/Course/presentation/views/course_view.dart';
import 'package:Mafaheem/features/search/views/widgets/search_grid_item_lower_content.dart';
import 'package:Mafaheem/features/search/views/widgets/search_grid_item_upper_content.dart';
import 'package:Mafaheem/features/search/views/widgets/tag_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchGridItem extends StatelessWidget {
  final Course course;

  const SearchGridItem({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>push(context, CourseView(course: course)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(width: 0.1, color: Theme.of(context).colorScheme.onSurface),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use Flexible to fit the available space
            AspectRatio(
              aspectRatio: 3 / 2,
              child: CachedNetworkImage(
                imageUrl: course.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridItemUpperContent(course:course),
            ),
            const SizedBox(height: 16),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridItemLowerContent(course:course),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
            ),
            const SizedBox(height: 14),
             Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                runSpacing: 8,
                spacing: 8,
                children: [
                  for (var category in course.categories!)
                    TagWidget(title: category.name, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
