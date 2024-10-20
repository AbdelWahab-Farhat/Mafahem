part of 'register_on_work_shop_cubit.dart';

@immutable
sealed class RegisterOnWorkShopState {}

final class RegisterOnWorkShopInit extends RegisterOnWorkShopState {}
final class RegisterOnWorkShopLoading extends RegisterOnWorkShopState {}
final class RegisterOnWorkShopSuccess extends RegisterOnWorkShopState {
  final String successMessage;
  RegisterOnWorkShopSuccess({required this.successMessage});
}
final class RegisterOnWorkShopFailure extends RegisterOnWorkShopState {
  final String errMessage;
  RegisterOnWorkShopFailure({required this.errMessage});
}