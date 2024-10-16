import 'dart:io';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PromoCoursesService {
  static Future<Either<Failure, List<Course>>> getPromoCourses() async {
    var dio = GetIt.instance<Dio>();

    try {
      var result = await dio.get(Routes.PROMO_COURSES_URL);

      // Check if the status code is 200 OK
      if (result.statusCode == HttpStatus.ok) {
        // Parse the courses from the response data
        List<Course> courses = List<Course>.from(
          result.data['data']['courses'].map((item) => Course.fromJson(item)).toList(),
        );
        return right(courses);
      } else {
        // Handle cases where the response is not 200 OK
        return left(ServerFailure(
            message:
                'Failed to fetch promo courses. Status code: ${result.statusCode}'));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: 'error: ${e.message}'));
    }
  }
}
