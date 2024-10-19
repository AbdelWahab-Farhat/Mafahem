import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/core/models/lecture.dart';
import 'package:Mafaheem/core/models/lesson.dart';
import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/current_lecture_title.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/lecture_list_view.dart';
import 'package:Mafaheem/features/Course/presentation/views/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LessonViewBody extends StatefulWidget {
  final Course course;
  final Lesson lesson;
  final Lecture lecture;
  const LessonViewBody(
      {super.key,
      required this.course,
      required this.lesson,
      required this.lecture});

  @override
  State<LessonViewBody> createState() => _LessonViewBodyState();
}

class _LessonViewBodyState extends State<LessonViewBody> {
  @override
  void initState() {
    context.read<VideoPlayerCubit>().initialize(
        widget.lecture.videoUrl ??
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        widget.course.id.toString(),
        widget.lesson.id.toString(),
        widget.lecture.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.lesson.title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.25,
              child: const VideoPlayerWidget()),
          CurrentLectureTitle(lecture: widget.lecture),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
              height: 0.2,
              thickness: 0.4,
            ),
          ),
          Expanded(
            child: LectureListView(lesson: widget.lesson , course: widget.course, lecture: widget.lecture,),
          ),
        ],
      ),
    );
  }
}





