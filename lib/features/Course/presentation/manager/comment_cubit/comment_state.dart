
part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}
final class CommentLoading extends CommentState {}
final class CommentSuccess extends CommentState {}
final class CommentFailure extends CommentState {}
