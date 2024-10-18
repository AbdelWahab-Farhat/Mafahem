part of 'video_player_cubit.dart';

@immutable
sealed class VideoPlayerState {}

final class VideoPlayerInitial extends VideoPlayerState {}
final class VideoPlayerLoading extends VideoPlayerState {}
final class VideoPlayerSuccess extends VideoPlayerState {}
final class VideoPlayerFailure extends VideoPlayerState {
  final String message;
  VideoPlayerFailure({required this.message});
}
