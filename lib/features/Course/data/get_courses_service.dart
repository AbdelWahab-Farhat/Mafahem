import 'dart:developer';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/category.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetCoursesService {
  static Future<Either<Failure, List<Course>>> fetchCoursesByCourseCategory(List<Category> courseCategories) async {
    log(courseCategories.toString());
    if (courseCategories.isEmpty) {
      return right([]);
    }

    try {
      var dio = GetIt.instance.get<Dio>();
      var res = await dio.get(Routes.GET_COURSES_URL, options: Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }));

      if (res.statusCode == 200 && res.data['data'] != null && res.data['data']['courses'] != null) {
        List<Course> courses = List<Course>.from(
            res.data['data']['courses'].map((item) => Course.fromJson(item)).toList()
        );

        var categoryIds = courseCategories.map((category) => category.id.toString()).toSet();
        var filteredCourses = courses.where((course) =>
        course.categories?.any((category) => categoryIds.contains(category.id.toString())) ?? false
        ).toList();

        log('Fetched courses: ${filteredCourses.length}');
        return right(filteredCourses);
      } else {
        return left(ServerFailure(
            message: 'Failed to fetch courses: ${res.data['message'] ?? 'Unknown error occurred'}'
        ));
      }
    } on DioException catch (e) {
      log('Dio exception: ${e.toString()}');
      if (e.response != null) {
        log('Error response data: ${e.response!.data}');
        log('Error response status: ${e.response!.statusCode}');
        return left(ServerFailure(
            message: e.response!.data['message'] ?? 'An unknown error occurred'
        ));
      } else {
        log('Error type: ${e.type.toString()}');
        return left(ServerFailure(message: 'An error occurred: $e'));
      }
    }
  }
}
