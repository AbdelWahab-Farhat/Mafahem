part of 'work_shop_detail_cubit.dart';

@immutable
sealed class WorkShopDetailState {}

final class WorkShopDetailLoading extends WorkShopDetailState {}
final class WorkShopDetailSuccess extends WorkShopDetailState {}
final class WorkShopDetailFailure extends WorkShopDetailState {
  final String errMessage;
  WorkShopDetailFailure({required this.errMessage});
}