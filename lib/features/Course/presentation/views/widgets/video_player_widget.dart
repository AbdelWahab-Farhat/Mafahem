import 'package:Mafaheem/core/widgets/custom_error_widget.dart';
import 'package:Mafaheem/core/widgets/custom_loading_widget.dart';
import 'package:Mafaheem/features/Course/presentation/manager/video_player_cubit/video_player_cubit.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        if (state is VideoPlayerFailure) {
          return const CustomErrorWidget(text: 'Error while loading video');
        } else if (state is VideoPlayerSuccess) {
          return Chewie(
              controller: context.read<VideoPlayerCubit>().chewieController!);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
