import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/models/work_shop.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CheckingRegistrationService {
  static Future<bool> checkingRegistration(String workShopId) async {
    var dio = GetIt.I<Dio>();
    var token = GetIt.I<TokenCubit>().user!.token;
    try {
      var response = await dio.get(Routes.GET_USER_WORK_SHOP_URL,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        List<WorkShop> workShops = (response.data as List)
            .map((e) => WorkShop.fromJson(e)).toList();
        return workShops.any((element) => element.id == int.parse(workShopId),);
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    }
  }
}
