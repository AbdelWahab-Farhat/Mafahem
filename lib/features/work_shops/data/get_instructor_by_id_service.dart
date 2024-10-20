


import 'dart:developer';
import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/instructor.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetInstructorByIdService {

  static Future<Either<Failure, Instructor>> getInstructorById(String instructorId) async {
    try {
      final dio = GetIt.I.get<Dio>();
      final response = await dio.get(Routes.GET_INSTRUCTORS_URL,options: Options(
        headers: {
          'Authorization': 'Bearer ${GetIt.I.get<TokenCubit>().user!.token}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',

        },
      ));


      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null && response.data['data'] != null) {
          List<Instructor> instructors = List<Instructor>.from(
            response.data['data'].map((item) => Instructor.fromJson(item)),
          );

          return Right(instructors.firstWhere((element) => element.id == int.parse(instructorId),));
        } else {
          return Left(ServerFailure(message: 'Unexpected response format.'));
        }
      } else {
        // Handle non-200 responses, assuming they include a 'message' field
        return Left(ServerFailure(message: response.data['message'] ?? 'Unknown error occurred.'));
      }
    } on DioException catch (dioError) {
      // Handle Dio exceptions
      return Left(ServerFailure(message: dioError.message ??  dioError.response?.data['message']  ?? 'An ee error occurred.'));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: 'An unexpected error occurred.'));
    }
  }

}