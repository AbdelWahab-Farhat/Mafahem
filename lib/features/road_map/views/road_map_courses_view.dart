import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_courses_view_body.dart';
import 'package:flutter/material.dart';


class RoadMapCoursesView extends StatelessWidget {
  final RoadMap roadMap;
  final List<Course> courses;

  const RoadMapCoursesView({super.key, required this.courses, required this.roadMap});

  @override
  Widget build(BuildContext context) {
    return  RoadMapCoursesViewBody(courses: courses, roadMap: roadMap,);
  }
}
