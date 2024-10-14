part of 'collect_data_cubit.dart';

@immutable
sealed class CollectDataState {}

final class CollectDataInitial extends CollectDataState {}
final class CollectDataSending extends CollectDataState {}
final class CollectDataSendingSuccess extends CollectDataState {
  final String successMessage;
  CollectDataSendingSuccess({required this.successMessage});
}
final class CollectDataSendingFailure extends CollectDataState {
  final String errMessage;
  CollectDataSendingFailure({required this.errMessage});
}