import 'package:Basera/core/apis/firebase_upload_api.dart';
import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void setup() {
  Dio dio = Dio(

    BaseOptions(connectTimeout: const Duration(seconds: 5)),
  );
  dio.interceptors.addAll([
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      enabled: kDebugMode,
    ),
  ]);
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<TokenCubit>(TokenCubit());
  getIt.registerSingleton<FirebaseUploadApi>(FirebaseUploadApi());

}
