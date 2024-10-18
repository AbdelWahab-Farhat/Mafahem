import 'package:Basera/core/models/lecture.dart';
import 'package:Basera/core/utility/styles.dart';
import 'package:Basera/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:Basera/features/Course/presentation/views/widgets/lesson_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class CurrentLectureTitle extends StatelessWidget {
  const CurrentLectureTitle({
    super.key,
    required this.lecture,
  });

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        var cubit = context.read<VideoPlayerCubit>();
        if (state is VideoPlayerSuccess) {
          return ListTile(
            trailing: Icon(
              FontAwesomeIcons.readme,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "المحاضرة الحالية : ${cubit.currentLecture?.title ?? "جمع المعلومات .."}",
              style: Styles.style18(context),
            ),
          );
        } else if (state is VideoPlayerFailure) {
          return const SizedBox();
        } else {
          return  const ShimmerVideoListTile();
        }
      },
    );
  }
}

class ShimmerVideoListTile extends StatelessWidget {
  const ShimmerVideoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary, // Base color for shimmer
      highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.4), // Highlight color for shimmer
      child: ListTile(
        trailing: Container(
          width: 24,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
        title: Container(
          width: 200,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.grey.shade300, // Placeholder for text
          ),
        ),
      ),
    );
  }
}
