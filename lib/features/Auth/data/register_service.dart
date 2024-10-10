import 'dart:io';
import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterService {
  final Dio dio;
  RegisterService(this.dio);

  Future<Either<Failure, String>> register(String userName, String email,
      String password, String confirmPassword) async {
    try {
      Response res = await dio.post(
        Routes.REGISTER_URL,
        data: {
          "name": userName,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );

      if (res.statusCode == HttpStatus.ok || res.statusCode == HttpStatus.created) {
        return right(res.data['message']);
      }
      else if (res.statusCode == HttpStatus.badRequest) {
        return left(ServerFailure(
            message: res.data['data']['email'][0] ?? res.data['message'] ?? "Error, Try Again Later."));
      } else {
        return left(ServerFailure(
            message: res.data['data'] ?? res.data['message'] ?? "Error, Try Again Later."));
      }
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.data['data']['email'][0] ?? e.response?.data['message'] ?? "Error, Try Again Later."));
    } catch (e) {
      return left(ServerFailure(message: 'Error, Try Again'));
    }
  }
}
