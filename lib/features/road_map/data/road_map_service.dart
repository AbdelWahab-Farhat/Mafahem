import 'dart:io';
import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/road_map.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RoadMapService {
  final Dio dio;
  RoadMapService({required this.dio});

  Future<Either<Failure, List<RoadMap>>> fetchLearnPaths() async {
    try {
      var res = await dio.get(Routes.ROAD_MAPS_URL);
      if (res.statusCode == HttpStatus.ok) {
        List<RoadMap> paths = List<RoadMap>.from(
            res.data['data'].map((item) => RoadMap.fromJson(item)).toList()
        );
        return right(paths);
      } else {
        return left(ServerFailure(message: res.data['message']));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return left(ServerFailure(message: e.response?.data['message'] ?? 'Unknown error occurred'));
      } else {
        return left(ServerFailure(message: 'Network error: ${e.message}'));
      }
    }
  }
}
