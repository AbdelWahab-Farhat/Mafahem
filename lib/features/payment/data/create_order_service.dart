import 'dart:io';

import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/coupon.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CreateOrderService {
  static Future<Either<Failure, String>> createOrder(Coupon? coupon) async {
    var dio = GetIt.instance.get<Dio>();
    var token = GetIt.instance.get<TokenCubit>();
    try {
      var res = await dio.post(Routes.ORDER_URL,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${token.user!.token}',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
          data: coupon != null
              ? {
                  'coupon_id': coupon.id,
                }
              : {});
      if (res.statusCode == HttpStatus.created ||
          res.statusCode == HttpStatus.ok) {
        return right(res.data['message']);
      } else {
        return left(ServerFailure(
            message: res.data['message'] ?? 'Error, Try Again Later.'));
      }
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.response?.data['message'] ?? 'Error, Try Again Later.'));
    } catch (e) {
      return left(ServerFailure(message: 'Error, Try Again Later.'));
    }
  }
}
