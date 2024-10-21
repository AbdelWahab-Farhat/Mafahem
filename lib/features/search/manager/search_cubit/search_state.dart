part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchSuccess extends SearchState {
  final List<Course> courses;
  SearchSuccess({required this.courses});
}
final class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure({required this.errMessage});
}
final class SearchLoading extends SearchState {}
final class SearchEmpty extends SearchState {}
