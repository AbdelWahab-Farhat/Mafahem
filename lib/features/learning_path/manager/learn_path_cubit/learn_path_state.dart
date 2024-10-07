part of 'learn_path_cubit.dart';

@immutable
sealed class LearnPathState {}

final class LearnPathInitial extends LearnPathState {}
final class LearnPathLoading extends LearnPathState {}
final class LearnPathSuccess extends LearnPathState {}
final class LearnPathFailure extends LearnPathState {
  final String errMessage;
  final Widget? errWidget;
  LearnPathFailure({required this.errMessage ,this.errWidget});
}
