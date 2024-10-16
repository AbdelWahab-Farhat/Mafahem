

import 'package:Basera/core/apis/routes.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/core/models/course.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ReviewService {

  static Future<Either<Failure, String>> sendReview(Course course, int rating,
      String review) async {

    var dio = GetIt.instance<Dio>();
    var token = GetIt.instance
        .get<TokenCubit>()
        .user!
        .token;

    try {
      // Send rating
      var ratingResponse = await dio.post(
        Routes.RATE_COURSES_URL,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'rating': rating,
          'course_id': course.id,
        },
      );
      if (ratingResponse.statusCode != 200) {
        return left(ServerFailure(message:'Failed to submit rating.'));
      }
      // Wait for the review request
      var reviewResponse = await dio.post(
        Routes.RATE_COURSES_URL,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'review': review,
          'course_id': course.id,
        },
      );
      if (reviewResponse.statusCode != 200) {
        return left(ServerFailure(message:'Failed to submit review.'));
      }

      // If both succeed, return success message
      return right('Review and rating submitted successfully');
    } catch (error) {
      return left(ServerFailure(message: 'An error occurred: $error'));
    }
  }
  }