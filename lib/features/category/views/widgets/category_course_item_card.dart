import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/views/course_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCourseItemCard extends StatelessWidget {
  final Course course;
  const CategoryCourseItemCard({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(context, CourseView(course: course),pageTransitionType: PageTransitionType.rightToLeft),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 1,
        semanticContainer: true,
        color: Theme.of(context).colorScheme.secondaryContainer..withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: Styles.style18(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      course.description ?? 'No description available',
                      style: Styles.style14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 26),
                    Text(
                      "التوجه:${course.level}" ?? 'No level available',
                      style: Styles.style14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: course.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Highlighted Price Display
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '${course.price.toString()} د.ل', // Assuming price is double
                      style: Styles.style20(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
