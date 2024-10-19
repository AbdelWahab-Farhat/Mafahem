import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class RemoveFromUserCartService {

  static Future<Either<Failure, String>> removeFromCart(String id) async {
    var dio = GetIt.instance.get<Dio>();
    var token = GetIt.instance.get<TokenCubit>().user!.token;

    try {
      var result = await dio.post(
        Routes.REMOVE_FROM_CART,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "course_id": id
        },
      );

      if (result.statusCode == 200) {
        return right('Successfully removed from cart');
      } else {
        return left(ServerFailure(message: 'Failed to remove from cart'));
      }
    }on DioException catch (e) {
      return left(ServerFailure(message:'error: $e'));
    }
  }
}

