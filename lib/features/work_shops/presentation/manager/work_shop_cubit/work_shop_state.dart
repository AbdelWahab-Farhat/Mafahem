part of 'work_shop_cubit.dart';

@immutable
sealed class WorkShopState {}

final class WorkShopLoading extends WorkShopState {}
final class WorkShopSuccess extends WorkShopState {}
final class WorkShopFailure extends WorkShopState {
  final String errMessage;
  WorkShopFailure({required this.errMessage});
}