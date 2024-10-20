import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetWorkShopsService {
  static Future<Either<Failure, List<WorkShop>>> getWorkShops() async {
    var dio = GetIt.I<Dio>();
    try {
      var response = await dio.get(Routes.GET_WORK_SHOPS_URL);
      if (response.statusCode == HttpStatus.ok) {
        return Right((response.data['data'] as List)
            .map((e) => WorkShop.fromJson(e))
            .toList());
      } else {
        return Left(ServerFailure(
            message: response.data['message'] ?? 'Error, Try Again'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
            message: e.response?.data['message'] ?? 'Error, Try Again'));
      } else {
        return Left(ServerFailure(message: 'Error , Try Again Later'));
      }
    }
  }
}
