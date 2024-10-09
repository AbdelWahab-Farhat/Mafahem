import 'dart:developer';
import 'dart:io';
import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  // Removes the stored token (used in logout)
  Future<void> removeToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('token'); // No need to check if the key exists
  }

  // Saves a token to SharedPreferences
  Future<void> saveToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token); // Overwrites any existing token
  }

  // Fetches user information based on the saved token
  Future<Either<Failure, User>> getUserByToken() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      if (token != null && token.isNotEmpty) {
        var dio = GetIt.instance.get<Dio>();

        var res = await dio.get(
          Routes.USER_BY_TOKEN_URL,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        );
        if (res.statusCode == HttpStatus.ok) {
          User user = User.fromJson(res.data);
          user.token = token;
          return right(user);
        } else {
          return left(ServerFailure(
              message: res.statusMessage ?? "An unexpected error occurred"));
        }
      } else {
        return left(ServerFailure(message: "Token not found"));
      }
    } on DioException catch (e) {
      log(e.toString());
      return left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(message: "An unexpected error occurred"));
    }
  }
}
