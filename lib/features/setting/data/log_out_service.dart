import 'dart:io';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/utility/functions/navigate_functions.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutService {
  static Future<bool> logOutUser() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var dio = GetIt.instance.get<Dio>();

      var result = await dio.post(Routes.LOGOUT_URL, options: Options(headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
      }));

      if (result.statusCode == HttpStatus.ok) {
        await prefs.remove('token');
        return true;
      } else if (result.statusCode == HttpStatus.unauthorized) {
        return false;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("DioError occurred: ${e.message}");
      return false;
    } catch (e) {
      print("An error occurred: $e");
      return false;
    }
  }
}
