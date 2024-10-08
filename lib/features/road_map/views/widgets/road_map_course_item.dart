import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_Tag_text_widget.dart';
import 'package:Basera/features/road_map/views/widgets/student_with_rate.dart';
import 'package:flutter/material.dart';

class RoadMapCourseItem extends StatelessWidget {
  final Course course;
  const RoadMapCourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    course.title,
                    style: Styles.style16(context).copyWith(fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 8),
                Text(
                  course.description,
                  style: Styles.style14(context).copyWith(color: Theme.of(context).colorScheme.secondary),
                  maxLines: 3,
                ),
                const SizedBox(height: 4),
                CustomTagTextWidget(text: course.level,color: Theme.of(context).colorScheme.onSurface,),
                const SizedBox(height: 4),
                 const StudentWithRate(rate: 3.6,studentCount: 1004,),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              course.image,
              height: 130,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
