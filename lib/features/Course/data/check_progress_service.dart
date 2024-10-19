


import 'dart:developer';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CheckProgressService {
  static Future<Either<Failure, void>> checkProgress(String courseId , String lessonId , String lectureId) async {
    try {
      final dio = GetIt.instance.get<Dio>();
      final token = GetIt.instance.get<TokenCubit>().user!.token;
      final result = await dio.post(
        Routes.MARK_LEACTURE_PROGRESS_COMPLETED(courseId, lessonId, lectureId),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (result.statusCode == 200) {
        return right(null);
      } else {
        return left(ServerFailure(message: result.data['message']));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.response?.data['message'] ?? 'Unknown error occurred'));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(message: 'Unknown error occurred'));
    }
  }
}