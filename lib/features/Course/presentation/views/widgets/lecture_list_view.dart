import 'package:Basera/core/models/course.dart';
import 'package:Basera/core/models/lecture.dart';
import 'package:Basera/core/models/lesson.dart';
import 'package:Basera/core/utility/size_config.dart';
import 'package:Basera/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:Basera/features/Course/presentation/views/widgets/current_lecture_title.dart';
import 'package:Basera/features/Course/presentation/views/widgets/lecture_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class LectureListView extends StatelessWidget {
  final Lecture lecture;
  final Lesson lesson;
  final Course course;
  const LectureListView({
    super.key,
    required this.lesson,
    required this.course,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    var videoPlayerCubit = context.read<VideoPlayerCubit>()..currentLecture = lecture;
    
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        if (state is VideoPlayerSuccess) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: lesson.lectures?.length ?? 0,
            itemBuilder: (context, index) {
              final lecture = lesson.lectures![index];
              return LectureItem(
                lecture: lecture,
                lesson: lesson,
                course: course,
                isPlayed: lecture.id == videoPlayerCubit.currentLecture!.id,
              );
            },
          );
        }
        else if (state is VideoPlayerFailure) {
          return const SizedBox();
        }
        return  ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const ShimmerVideoListTile(),
        );
      },
    );
  }
}

class LectureLoadingWidget extends StatelessWidget {
  const LectureLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(baseColor: Theme.of(context).colorScheme.primary, highlightColor:
        Theme.of(context).colorScheme.primary.withOpacity(0.2)
        , child: ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          title: Container(
            width: SizeConfig.screenWidth * 0.4,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          trailing: const Icon(FontAwesomeIcons.play),
        );
      },
    ));
  }
}
