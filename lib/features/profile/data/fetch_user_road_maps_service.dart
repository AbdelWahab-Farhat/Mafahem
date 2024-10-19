import 'dart:developer';
import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FetchUserRoadMapsService {
  static Future<Either<Failure, List<RoadMap>>> getUserRoadMaps() async {
    try {
      // Get the Dio instance from GetIt
      var dio = GetIt.instance.get<Dio>();

      // Make the API request
      var response = await dio.get(
        Routes.USER_ROAD_MAPS,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${GetIt.instance.get<TokenCubit>().user!.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check for successful response
      if (response.statusCode == HttpStatus.ok) {
        log(response.toString());

        // Map the response to a list of RoadMap instances
        final roadMaps = (response.data['enrollments'] as List)
            .map((item) => RoadMap.fromJson(item))
            .toList();

        return right(roadMaps); // Return the mapped road maps
      } else {
        return left(ServerFailure(
          message: response.data['message'] ?? 'Error, Try Again',
        ));
      }
    } on DioException catch (e) {
      log("Dio error: ${e.response?.data ?? 'Unknown error'}");
      return left(ServerFailure(
        message: e.response?.data['message'] ?? 'Error, Try Again',
      ));
    } catch (e) {
      log("Unexpected error: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }
}
