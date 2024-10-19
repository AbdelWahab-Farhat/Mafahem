import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestPasswordService {
  final Dio dio;
  RestPasswordService({required this.dio});
  
  Future<Either<Failure, String>> restPassword(String email) async{
    try {
      var res = await dio.post(Routes.REST_PASSWORD_URL,data: {
        "email":email
      });
      if (res.statusCode == HttpStatus.ok) {
        // NO NEEDED JUST TO KNOW IF IT RIGHT
        return right(res.data['status']);
      }
      else {
        return left(ServerFailure(message: res.data['message'].toString()));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message.toString()));
    }
  }
}