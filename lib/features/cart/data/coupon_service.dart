import 'dart:developer';
import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/coupon.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CouponService {

  static Future<Either<Failure, Coupon>> applyCoupon(String couponCode) async{
    var dio = GetIt.instance.get<Dio>();
    var token = GetIt.instance.get<TokenCubit>();
    try {
      var res = await dio.get(Routes.APPLY_COUPON_URL,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${token.user!.token}',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
          data: {
        "coupon_code": couponCode
      });
      if (res.statusCode == HttpStatus.ok) {
        log(res.data.toString());
        return right(Coupon.fromJson(res.data['coupon']));
      }
      else {
        log(res.data['message'].toString());
        return left(ServerFailure(message: res.data['message'].toString()));
      }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.response?.data['message'].toString() ?? 'Error Not Found'));
    }
  }
}