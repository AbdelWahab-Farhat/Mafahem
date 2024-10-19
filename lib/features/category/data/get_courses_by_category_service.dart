import 'dart:io';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/category.dart';
import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Course/data/get_courses_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetCoursesByCategoryService {
  static Future<Either<Failure, List<Course>>> fetchCoursesByCategory(
      Category category) async {
    var dio = GetIt.instance.get<Dio>();

    try {
      var res = await dio.get(Routes.GET_COURSES_URL,
          options: Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }));

      if (res.statusCode == HttpStatus.ok) {
        List<Course> courses =
        (res.data['data']['courses'] as List).map((e) => Course.fromJson(e)).toList();

        List<Course> coursesByCategory = courses
            .where(
              (element) =>
          element.categories?.any((cat) => cat.id == category.id) ?? false,
        )
            .toList();

        return Right(coursesByCategory);
      } else {
        // Handling non-200 status codes
        return Left(ServerFailure(message: 'Error: ${res.statusCode} - ${res.statusMessage}'));
      }
    } catch (e) {
      // Handling Dio or other exceptions
      if (e is DioException) {
        return Left(ServerFailure(message: 'Dio error: ${e.message}'));
      } else {
        return Left(ServerFailure(message: 'Unknown error: ${e.toString()}'));
      }
    }
  }
}

