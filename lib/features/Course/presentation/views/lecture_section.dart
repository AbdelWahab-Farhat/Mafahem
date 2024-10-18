import 'dart:developer';

import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/models/lesson.dart';
import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/core/widgets/custom_divider.dart';
import 'package:Basera/core/widgets/custom_empty_state_widget.dart';
import 'package:Basera/features/Course/presentation/views/lesson_view.dart';
import 'package:flutter/material.dart';

class LectureSection extends StatelessWidget {
  final Course course;
  const LectureSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    if (course.lessons == null || course.lessons!.isEmpty) {
      return CustomEmptyStateWidget(
          title: 'لاتوجد دروس',
          subTitle: 'سيتم أضافة الدروس قريبا',
          image: Image.asset('lib/assets/images/lessons-empty-state.png',width: SizeConfig.screenWidth * 0.8,height: SizeConfig.screenHeight * 0.3,));
    }
    return LessonsListView(course: course);
  }
}

class LessonsListView extends StatelessWidget {
  const LessonsListView({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Removes divider
        splashColor: Colors.transparent, // Removes splash color
        highlightColor: Colors.transparent, // Removes highlight color
      ),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: course.lessons!.length,
        itemBuilder: (context, index) {
          return LessonItem(
            course: course,
            lesson: course.lessons![index],
            index: index + 1,
          );
        },
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final int index;
  const LessonItem({
    super.key,
    required this.lesson,
    required this.index, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: Styles.customLinerGradient(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2), // shadow y = 2
          ),
        ],
      ),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        iconColor: Theme.of(context).colorScheme.onPrimary,
        collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          '-$index ${lesson.title}',
          style: Styles.style18(context)
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        children: allLectures(context, lesson, course),
      ),
    );
  }
}

List<Widget> allLectures(BuildContext context, Lesson lesson, Course course) {
  List<Widget> lectures = [];
  log(lesson.lectures.toString());
  for (var lecture in lesson.lectures!) {
    lectures.add(GestureDetector(
      onTap: () {
        push(context, LessonView(lesson: lesson, course: course, lecture: lecture,));
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              maxLines: 1,
              lecture.title,
              style: Styles.style16(context)
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          const CustomDivider()
        ],
      ),
    ));
  }
  return lectures;
}
