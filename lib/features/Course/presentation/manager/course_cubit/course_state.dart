part of 'course_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}
final class CourseLoading extends CourseState {}
final class CourseFailure extends CourseState {
  final String message;
  CourseFailure({required this.message});
}
final class CourseInCart extends CourseState {}
final class CourseOwned extends CourseState{}
