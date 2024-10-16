part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}
final class ReviewLoading extends ReviewState {}
final class ReviewSuccess extends ReviewState {
  final String message;
  ReviewSuccess({required this.message});
}
final class ReviewFailure extends ReviewState {
  final String errMessage;
  ReviewFailure({required this.errMessage});
}
