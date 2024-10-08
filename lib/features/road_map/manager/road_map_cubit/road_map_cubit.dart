import 'package:Basera/core/models/road_map.dart';
import 'package:Basera/features/road_map/data/road_map_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'road_map_state.dart';

class RoadMapCubit extends Cubit<RoadMapState> {
  List<RoadMap> roadMaps = [];
  RoadMapCubit() : super(RoadMapInitial());

  void fetchRoadMaps() async {
    emit(RoadMapLoading());
    var result = await RoadMapService(dio: GetIt.instance<Dio>()).fetchLearnPaths();
    result.fold(
        (failure) => emit(RoadMapFailure(errMessage: failure.message)),
        (items) {
          roadMaps = items;
          emit(RoadMapSuccess());
        });
  }
}
