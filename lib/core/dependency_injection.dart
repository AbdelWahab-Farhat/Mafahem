import 'package:Basera/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  Dio dio = Dio(
    BaseOptions(connectTimeout: const Duration(seconds: 5)),
  );
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<TokenCubit>(TokenCubit());
}
