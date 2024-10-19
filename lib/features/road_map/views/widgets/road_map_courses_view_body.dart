import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_course_item.dart';
import 'package:flutter/material.dart';

class RoadMapCoursesViewBody extends StatelessWidget {
  final List<Course> courses;
  const RoadMapCoursesViewBody({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الدورات المتوفرة'),
      body: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          itemBuilder: (context, index) => RoadMapCourseItem(course: courses[index],),
      ),
    );
  }
}
