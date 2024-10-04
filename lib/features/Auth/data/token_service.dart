import 'dart:io';

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  // TODO: WE WILL USE IT IN LOGOUT
  Future<void> removeToken() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      prefs.remove('token');
    }
  }

  Future<void> saveToken(String token) async{
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      prefs.setString('token',token);
    }
  }

  Future<Either<Failure, User>> getUserByToken() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (token != null && token.isNotEmpty) {
        var dio = GetIt.instance.get<Dio>();

        var res = await dio.get(
          Routes.USER_BY_TOKEN,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
        if (res.statusCode == HttpStatus.ok) {
          return right(User.fromJson(res.data));
        } else {
          return left(ServerFailure(message: res.statusMessage ?? "حدث خطأ ما"));
        }
      } else {
        return left(ServerFailure(message: "لم يتم العثور على التوكن"));
      }
    }on DioException catch (e) {
      return left(ServerFailure(message: e.message.toString()));
    }
  }
  }