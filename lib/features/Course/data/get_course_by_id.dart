import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// later we complete that
//TODO FINISH IT WITH REFREACH
class GetCourseByIdService {
  static Future<Either<Failure, Course>> getCourseById(String id) async {
    try {
      final response = await Dio().get(
        '${Routes.GET_COURSE_BY_ID_URL}/$id',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return right(Course.fromJson(response.data['data']));
      } else {
        return left(ServerFailure(message: response.data['message']));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.response?.data['message'] ?? 'error  occurred'));
    }
  }
}