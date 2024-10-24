import 'dart:developer';
import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/course.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FetchUserCoursesService {
  static Future<Either<Failure, List<Course>>> getUserCourses() async {
    try {
      var dio = GetIt.instance.get<Dio>();
      var res = await dio.get(Routes.USER_COURSES_URL,
          options: Options(headers: {
            'Authorization':
                'Bearer ${GetIt.instance.get<TokenCubit>().user!.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }));
      if (res.statusCode == HttpStatus.ok) {
        log(res.toString());
        return right(List<Course>.from(res.data['data']['enrollments']
            .map((item) => Course.fromJson(item))));
      }
      else {
        return left(ServerFailure(message: res.data['message'] ?? 'Error, Try Again'));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.response?.data['message'] ?? 'Error, Try Again'));
    } catch (e) {
      return left( ServerFailure(message: e.toString()));
    }
  }
}
