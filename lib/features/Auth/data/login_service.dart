import 'dart:developer';
import 'dart:io';
import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/user.dart';
import 'package:Basera/features/Auth/data/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio dio;
  LoginService(this.dio);

  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      Response res = await dio.post(
        Routes.LOGIN_URL,
        data: {"email": email, "password": password},
      );
      log(res.statusCode.toString());
      log(res.data.toString());
      if (res.statusCode == HttpStatus.ok) {
        User user = User.fromJson(res.data);
        if (user.data?.emailVerifiedAt == null) {
          return left(ServerFailure(message: 'Please Verify Your Email First'));
        }
        await TokenService().saveToken(user.token!);
        return right(user);
      } else {
        return left(ServerFailure(message: res.data['message'] ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      log(e.message ?? e.error?.toString() ?? "wtf");
      return left(ServerFailure(message: e.response?.data['message']?? 'Error, Try Again'));
    }
  }
}
