import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class MostOrderedCoursesService {
  static Future<Either<Failure, List<Course>>> getMostOrderedCourses() async {
    var dio = GetIt.I<Dio>();

    try {
      var response = await dio.get(Routes.MOST_ORDERED_COURSES);

      // Check for successful response (200 OK)
      if (response.statusCode == HttpStatus.ok) {
        // Safely parse the data
        if (response.data != null && response.data['data'] != null) {
          return Right((response.data['data']['courses'] as List)
              .map((e) => Course.fromJson(e))
              .toList());
        } else {
          return Left(
              ServerFailure(message: 'Invalid data format from server.'));
        }
      }
      else if (response.statusCode == HttpStatus.notFound) {
        return Left(ServerFailure(message: 'Requested resource not found.'));
      } else if (response.statusCode == HttpStatus.internalServerError) {
        return Left(
            ServerFailure(message: 'Server error. Please try again later.'));
      } else {
        return Left(
            ServerFailure(message: 'Unexpected error: ${response.statusCode}'));
      }
    } on DioException catch (dioError) {
      return Left(ServerFailure(
          message: dioError.response?.data['message'] ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Unexpected error: ${e.toString()}'));
    }
  }
}
