import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;


void setup() {
  Dio dio = Dio(
    BaseOptions(

    ),
  );
  getIt.registerSingleton<Dio>(dio);
}