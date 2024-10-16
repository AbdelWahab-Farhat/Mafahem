part of 'promo_courses_cubit.dart';

@immutable
sealed class PromoCoursesState {}

final class PromoCoursesInitial extends PromoCoursesState {}

final class PromoCoursesLoading extends PromoCoursesState {}
final class PromoCoursesFailure extends PromoCoursesState {
  final String message;
  PromoCoursesFailure({required this.message});
}
final class PromoCoursesSuccess extends PromoCoursesState {
  final List<Course> courses;
   PromoCoursesSuccess({required this.courses});
}
