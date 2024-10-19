import 'dart:developer';
import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/certificate.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FetchUserCertificateService {

  static Future<Either<Failure, List<Certificate>>> getUserCertificate() async {
    try {
      var dio = GetIt.instance.get<Dio>();
      var res = await dio.get(Routes.USER_CERTIFICATE_URL,
          options: Options(headers: {
            'Authorization':
            'Bearer ${GetIt.instance.get<TokenCubit>().user!.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }));
      if (res.statusCode == HttpStatus.ok) {
        log(res.toString());
        return right(List<Certificate>.from(res.data['data'].map((item) => Certificate.fromJson(item))));
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