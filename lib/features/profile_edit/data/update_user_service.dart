import 'dart:io';
import 'package:Mafaheem/core/apis/firebase_upload_api.dart';
import 'package:Mafaheem/core/apis/routes.dart';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UpdateUserService {
  static Future<Either<Failure, String>> updateUser(String name,
      String imageUrl, String password, String confirmPassword) async {
    try {
      var dio = GetIt.instance.get<Dio>();
      var user = GetIt.instance.get<TokenCubit>().user;

      if (user == null) {
        return Left(ServerFailure(message: "User not logged in"));
      }

      String uploadedImageURL = user.profilePhotoUrl;
      if (imageUrl.isNotEmpty) {
        var uploadImageResult =
            await FirebaseUploadApi.uploadAndGetURL(File(imageUrl));
        uploadImageResult.fold(
          (failure) => throw FirebaseFailure(
              message: 'Error uploading image, please try again'),
          (url) => uploadedImageURL = url,
        );
      }

      // API request to update user
      var result = await dio.post(
        Routes.UPDATE_USER_URL,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${user.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "name": name,
          "profile_photo_url": uploadedImageURL,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );

      // Handling the response
      if (result.statusCode == 200) {
        GetIt.instance.get<TokenCubit>().user!.name = name;
        GetIt.instance.get<TokenCubit>().user!.profilePhotoUrl = uploadedImageURL;
        return const Right('تم التحديث بنجاح');
      } else {
        return Left(ServerFailure(
            message: result.data['message'] ?? 'Unknown server error'));
      }
    } on DioException catch (dioError) {
      // Handle Dio-related errors
      if (dioError.response != null) {
        return Left(ServerFailure(
          message: dioError.response?.data['message'] ??
              'Error updating user profile',
        ));
      } else {
        return Left(ServerFailure(
            message: 'Network error, please check your connection'));
      }
    } on FirebaseFailure catch (firebaseError) {
      return Left(FirebaseFailure(message: firebaseError.message));
    } catch (error) {
      return Left(
          ServerFailure(message: 'An unexpected error occurred: $error'));
    }
  }
}
