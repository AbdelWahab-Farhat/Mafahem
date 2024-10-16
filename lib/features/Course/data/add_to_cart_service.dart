import 'dart:developer';
import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AddToCartService {
  static Future<Either<Failure, String>> addToCart(String id) async {
    try {
      final dio = GetIt.instance.get<Dio>();
      final token = GetIt.instance.get<TokenCubit>().user!.token;
      final result = await dio.post(
        Routes.ADD_TO_USER_CART,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {"course_id": id},
      );
      if (result.statusCode == 200) {
        return right(result.data['message']);
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
