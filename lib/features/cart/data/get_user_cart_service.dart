import 'dart:developer';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/cart.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetUserCartService {
  static Future<Either<Failure,Cart>> getUserCart() async {
    var dio = GetIt.instance.get<Dio>();
    var token = GetIt.instance.get<TokenCubit>().user!.token;
    try {
      var result = await dio.get(
        Routes.USER_CART_URL,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      log(result.data.toString());

      // Check for a successful response
      if (result.statusCode == 200) {
        // Parse the response data into CartModel
        return right(Cart.fromJson(result.data['data'] as Map<String, dynamic>));
      }
      if (result.statusCode == 404) {
        return left(ServerFailure(message: 'Cart is Empty.'));}
      else {
        log('Failed to load cart. Status code: ${result.statusCode}');
        return left(ServerFailure(message: 'Failed to load cart.'));
      }
    }on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(message: 'Cart is Empty.'));
      }
      return left(ServerFailure(message: 'Error fetching user cart.\n${e.message}'));
    }
  }
}

