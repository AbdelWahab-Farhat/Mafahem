part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoading extends OrderState {}
final class OrderSuccess extends OrderState {
  final String couponMessage;

  OrderSuccess({required this.couponMessage});
}
final class CouponFailure extends OrderState {
  final String errMessage;
  CouponFailure({required this.errMessage});
}
