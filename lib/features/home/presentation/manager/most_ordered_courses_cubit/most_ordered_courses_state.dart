part of 'most_ordered_courses_cubit.dart';

@immutable
sealed class MostOrderedCoursesState {}

final class MostOrderedCoursesLoading extends MostOrderedCoursesState {}
final class MostOrderedCoursesSuccess extends MostOrderedCoursesState {
  final List<Course> courses;
  MostOrderedCoursesSuccess({required this.courses});
}
final class MostOrderedCoursesFailure extends MostOrderedCoursesState {
  final String errMessage;
  MostOrderedCoursesFailure({required this.errMessage});
}