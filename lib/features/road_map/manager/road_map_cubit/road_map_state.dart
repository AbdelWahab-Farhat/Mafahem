part of 'road_map_cubit.dart';


@immutable
sealed class RoadMapState {}

final class RoadMapInitial extends RoadMapState {}
final class RoadMapLoading extends RoadMapState {}
final class RoadMapSuccess extends RoadMapState {}
final class RoadMapFailure extends RoadMapState {
  final String errMessage;
  final Widget? errWidget;
  RoadMapFailure({required this.errMessage ,this.errWidget});
}
