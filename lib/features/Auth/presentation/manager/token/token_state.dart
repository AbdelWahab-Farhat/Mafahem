part of 'token_cubit.dart';

@immutable
sealed class TokenState {}

final class TokenInitial extends TokenState {}
final class TokenAuthenticated extends TokenState {}
class TokenLoading extends TokenState {}
final class TokenUnauthenticated extends TokenState {}