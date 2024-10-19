import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/models/coupon.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class OrderService {

  submitOrder(Coupon? coupon) {
    var dio = GetIt.instance.get<Dio>();
    var token = GetIt.instance.get<TokenCubit>();
    dio.post(Routes.ORDER_URL,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token.user!.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'coupon_id': coupon?.id,
         });
    }
}