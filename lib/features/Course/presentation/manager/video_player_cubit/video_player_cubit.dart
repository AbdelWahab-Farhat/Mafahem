import 'dart:developer';
import 'package:Mafaheem/core/models/lecture.dart';
import 'package:Mafaheem/features/Course/data/check_progress_service.dart';
import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'; // Add this import

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  Lecture? currentLecture;
  BuildContext context;
  Icon icon = const Icon(FontAwesomeIcons.play);
  VideoPlayerCubit(this.context) : super(VideoPlayerInitial());

  // Initialize video player
  Future<void> initialize(String url, String courseId, String lessonId, String lectureId) async {
    try {
      emit(VideoPlayerLoading());
      log(url);
      final file = await DefaultCacheManager().getSingleFile(url);

      // Create VideoPlayerController with the video file
      videoPlayerController = VideoPlayerController.file(file);
      await videoPlayerController!.initialize();
      


      // Initialize Chewie controller
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        looping: false,
        showControlsOnInitialize: false,
        // TODO CHANGE IT IF IT DIFFRENT DEAPDENDS ON PHONE
        aspectRatio: 2,
        allowFullScreen: true,
        allowPlaybackSpeedChanging: true,
        allowedScreenSleep: true,
        cupertinoProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
          backgroundColor: Colors.black45,
          bufferedColor: Colors.grey,
        ),
        materialProgressColors: ChewieProgressColors(
          playedColor: Theme.of(context).colorScheme.primary,
          handleColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Colors.black45,
          bufferedColor: Theme.of(context).colorScheme.secondary,
        ),
        hideControlsTimer: const Duration(seconds: 2),
        optionsTranslation: OptionsTranslation(
          cancelButtonText: 'الغاء',
          playbackSpeedButtonText: 'السرعة',
        ),
      );

      // Check video progress
      checkIfVideoCompleted(courseId, lessonId, lectureId);

      emit(VideoPlayerSuccess());
    } catch (e) {
      emit(VideoPlayerFailure(message: e.toString()));
    }
  }

  // Check if video is completed and call API when done
  void checkIfVideoCompleted(String courseId, String lessonId, String lectureId) {
    void listener() async {
      if (videoPlayerController!.value.isCompleted) {
        log("Video completed, calling progress API...");
        await CheckProgressService.checkProgress(courseId, lessonId, lectureId);
        videoPlayerController!.removeListener(listener);
      }
    }

    videoPlayerController!.addListener(listener);
  }

  // Change video and reinitialize
  Future<void> changeVideo(String videoUrl, String courseId, String lessonId, String lectureId) async {
    // Dispose previous video and controllers
    await _disposeCurrentVideo();

    // Initialize new video
    await initialize(videoUrl, courseId, lessonId, lectureId);
  }

  // Dispose the current video and controllers
  Future<void> _disposeCurrentVideo() async {
    if (videoPlayerController != null) {
      await videoPlayerController!.pause();
      await videoPlayerController!.dispose();
      videoPlayerController = null;
    }
    if (chewieController != null) {
      await chewieController!.pause();
      chewieController!.dispose();
      chewieController = null;
    }
  }

  // Override close to dispose controllers properly
  @override
  Future<void> close() async {
    await _disposeCurrentVideo();
    return super.close();
  }
}
