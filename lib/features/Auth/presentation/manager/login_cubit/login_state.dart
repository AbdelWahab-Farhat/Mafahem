part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final String successMessage;
  LoginSuccess({required this.successMessage});
}
final class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}
