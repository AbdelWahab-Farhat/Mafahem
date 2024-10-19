part of 'category_courses_cubit.dart';

@immutable
sealed class CategoryCoursesState {}

final class CategoryCoursesInitial extends CategoryCoursesState {}
final class CategoryCoursesSuccess extends CategoryCoursesState {}
final class CategoryCoursesFailure extends CategoryCoursesState {
  final String errMessage;
  CategoryCoursesFailure({required this.errMessage});
}
final class CategoryCoursesLoading extends CategoryCoursesState {}
