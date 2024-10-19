import 'dart:io';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/core/models/category.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class GetCategoriesService {
  final Dio dio;
  GetCategoriesService({required this.dio});

  Future<Either<Failure, List<Category>>> fetchCategories() async {
    try {
    Response res = await Dio().get(Routes.CATEGORY_URL);
      if (res.statusCode == HttpStatus.ok) {
        List<Category> categories = List<Category>.from(
            res.data['data'].map((item) => Category.fromJson(item)).toList()
        );
        return right(categories);
      } else {
        return left(ServerFailure(message: res.data['message']));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return left(ServerFailure(message: e.response?.data?? 'Unknown error occurred'));
      } else {
        return left(ServerFailure(message: 'Network error: ${e.message}'));
      }
    }
  }
}
