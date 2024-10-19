import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/utility/functions/navigate_functions.dart';
import 'package:Mafaheem/core/utility/styles.dart';
import 'package:Mafaheem/core/widgets/rate_widget.dart';
import 'package:Mafaheem/features/Course/presentation/views/course_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimilarCoursesItem extends StatelessWidget {
  final Course course;
  const SimilarCoursesItem({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushReplacement(context, CourseView(course: course)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: [
              Text(course.title,style: Styles.style16(context).copyWith(fontWeight: FontWeight.w600),),
              const SizedBox(height: 4,),
               RateWidget(rate: course.averageRating ?? 0,),
              Text('${course.enrollmentCount} طالب',style: Styles.style16(context),),
            ],
          ),
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              width: 85,
              height: 85,
              child: CachedNetworkImage(imageUrl: course.image,fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 85,
                  height: 85,
                  color: Colors.white,
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}
