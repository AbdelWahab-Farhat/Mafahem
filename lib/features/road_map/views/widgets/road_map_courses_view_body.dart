import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_filled_button.dart';
import 'package:Mafaheem/features/payment/data/payment_item_type.dart';
import 'package:Mafaheem/features/payment/presentation/views/payment_view_sheet.dart';
import 'package:Mafaheem/features/road_map/data/calculate_road_map_service.dart';
import 'package:Mafaheem/features/road_map/views/widgets/road_map_course_item.dart';
import 'package:flutter/material.dart';

class RoadMapCoursesViewBody extends StatelessWidget {
  final RoadMap roadMap;
  final List<Course> courses;

  const RoadMapCoursesViewBody(
      {super.key, required this.courses, required this.roadMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: CustomFilledButton(
          onPressed: () {
            showPaymentViewSheet(
                context,
                CalculateRoadMapService.calculateRoadMapFullPrice(roadMap),
                PaymentItemType.roadMap,
                null,
                roadMap);
          },
          title:
              '${CalculateRoadMapService.calculateRoadMapFullPrice(roadMap).toStringAsFixed(1)} د.ل شامل الخصم',
          width: 250,
          fontSize: 16,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: const CustomAppBar(title: 'الدورات المتوفرة'),
      body: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        itemBuilder: (context, index) => RoadMapCourseItem(
          course: courses[index],
        ),
      ),
    );
  }
}
