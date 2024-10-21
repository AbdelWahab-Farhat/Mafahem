import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetSearchCoursesService {
  static Future<Either<Failure, List<Course>>> getSearchCourses() async {
    var dio = GetIt.I<Dio>();

    try {
      var res = await dio.get(
        Routes.GET_COURSES_URL,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
      );

      if (res.statusCode == HttpStatus.ok) {
        List<Course> courses = List<Course>.from(
            res.data['data']['courses'].map((item) => Course.fromJson(item)));
        return Right(courses);
      } else {
        return Left(ServerFailure(message: res.data['message'] ?? 'Error occurred'));
      }
    } on DioException catch (dioError) {
      return Left(ServerFailure(message: dioError.response?.data['message'] ?? 'Error occurred'));
    } catch (error) {
      return Left(UnknownFailure(message: 'Unexpected error occurred'));
    }
  }
}
