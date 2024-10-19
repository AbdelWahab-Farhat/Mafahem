import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/lecture.dart';
import 'package:Mafaheem/core/models/lesson.dart';
import 'package:Mafaheem/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/lesson_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonView extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final Lecture lecture;
  const LessonView({super.key, required this.lesson, required this.course, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerCubit(context),
      child:  LessonViewBody(course: course, lesson: lesson, lecture: lecture,),
    );
  }
}
