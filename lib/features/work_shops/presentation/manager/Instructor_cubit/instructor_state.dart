part of 'instructor_cubit.dart';

@immutable
sealed class InstructorState {}

final class InstructorLoading extends InstructorState {}
final class InstructorSuccess extends InstructorState {}
final class InstructorFailure extends InstructorState {
  final String errMessage;
  InstructorFailure({required this.errMessage});
}