import 'package:Mafaheem/core/apis/firebase_upload_api.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/search/manager/category_picker_cubit/category_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/level_picker_cubit/level_picker_cubit.dart';
import 'package:Mafaheem/features/search/manager/price_range_cubit/price_range_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<TokenCubit>(TokenCubit());

  Dio dio = Dio(
    BaseOptions(connectTimeout: const Duration(seconds: 6,),
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${GetIt.instance.get<TokenCubit>().user?.token}',
      }
    ),
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
  getIt.registerSingleton<FirebaseUploadApi>(FirebaseUploadApi());
}
