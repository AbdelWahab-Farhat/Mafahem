

import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/road_map.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/road_map/data/calculate_road_map_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CreateRoadmapOrderService {
  static Future<Either<Failure, String>> createRoadmapOrder(RoadMap roadMap) async {
    var discountPrice = CalculateRoadMapService.calculateRoadMapFullPrice(roadMap);
    var dio = GetIt.I<Dio>();
    var token = GetIt.I<TokenCubit>().user!.token;
    var response = await dio.post(
      Routes.CREATE_ROAD_MAP_ORDER_URL,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: {
        'road_map_id': roadMap.id,
        'price_at_purchase': discountPrice
      },
    );
    if (response.statusCode == HttpStatus.created || response.statusCode == HttpStatus.ok) {
      return right(response.data['message']);
    } else {
      return left(ServerFailure(message: response.data['message'] ?? 'Error, Try Again'));
    }
  }
}