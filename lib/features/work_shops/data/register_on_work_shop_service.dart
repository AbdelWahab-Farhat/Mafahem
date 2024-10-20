import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class RegisterOnWorkShopService {

  static Future<Either<Failure, String>> registerOnWorkShop(String id) async {
    var dio = GetIt.I<Dio>();
    var token = GetIt.I<TokenCubit>().user!.token;
      try {
        var response = await dio.post(Routes.REGSITER_ON_WORK_SHOP_URL(id),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        )
        );
        if (response.statusCode == HttpStatus.ok) {
          return Right(response.data['message']);
        }
        else {
          return Left(ServerFailure(message: response.data['message'] ?? 'Error, Try Again'));
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == HttpStatus.badRequest) {
          return Left(ServerFailure(message: e.response?.data['message'] ?? 'Error, Try Again'));
        }
        else {
          return Left(ServerFailure(message: e.response?.data['message'] ?? 'Error, Try Again'));
        }
      }

    }
  }
