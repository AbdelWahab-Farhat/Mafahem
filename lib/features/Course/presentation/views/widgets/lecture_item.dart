import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/models/lecture.dart';
import 'package:Basera/core/models/lesson.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LectureItem extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final Lecture lecture;
  final bool isPlayed;
  const LectureItem({
    super.key,
    required this.lecture,
    required this.lesson,
    required this.course,
    required this.isPlayed,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<VideoPlayerCubit>();
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: Icon(
        isPlayed ? Icons.play_circle_fill : Icons.play_circle_outline,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        lecture.title,
        style: isPlayed
            ? Styles.style16(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            : Styles.style16(context),
      ),
      onTap: () {
        cubit.currentLecture = lecture;
        cubit.changeVideo(
            lecture.videoUrl ??
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            course.id.toString(),
            lesson.id.toString(),
            lecture.id.toString());
      },
    );
  }
}
