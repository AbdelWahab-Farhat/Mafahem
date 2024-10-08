import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/learning_path/views/widgets/road_map_courses_view_body.dart';
import 'package:flutter/material.dart';


class RoadMapCoursesView extends StatelessWidget {
  final List<Course> courses;

  const RoadMapCoursesView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return  RoadMapCoursesViewBody(courses: courses,);
  }
}
