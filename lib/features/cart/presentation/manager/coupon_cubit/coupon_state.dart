part of 'coupon_cubit.dart';

@immutable
sealed class CouponState {}

final class CouponInitial extends CouponState {}
final class CouponLoading extends CouponState {}
final class CouponSuccess extends CouponState {
  final String couponMessage;

  CouponSuccess({required this.couponMessage});
}
final class CouponFailure extends CouponState {
  final String errMessage;
  CouponFailure({required this.errMessage});
}
