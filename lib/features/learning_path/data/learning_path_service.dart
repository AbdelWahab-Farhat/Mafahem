import 'dart:developer';
import 'dart:io';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/learn_path.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LearningPathService {
  final Dio dio;
  LearningPathService({required this.dio});

  Future<Either<Failure, List<LearnPath>>> fetchLearnPaths() async {
    try {
      var res = await dio.get(Routes.ROAD_MAPS_URL);
      if (res.statusCode == HttpStatus.ok) {
        List<LearnPath> paths = List<LearnPath>.from(
            res.data['data'].map((item) => LearnPath.fromJson(item)).toList()
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
