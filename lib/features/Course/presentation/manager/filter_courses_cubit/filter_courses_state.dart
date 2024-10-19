part of 'filter_courses_cubit.dart';

@immutable
sealed class FilterCoursesState {}

final class FilterCoursesInitial extends FilterCoursesState {}
final class FilterCoursesLoading extends FilterCoursesState {}
final class FilterCoursesSuccess extends FilterCoursesState {}
final class FilterCoursesFailure extends FilterCoursesState {
  final String message;
  FilterCoursesFailure({required this.message});
}
