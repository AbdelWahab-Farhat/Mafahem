
import 'package:Mafaheem/core/error/failure.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class SendTeacherDataService {
  static Future<Either<Failure, String>> sendTeacherData(
      {required String name,
      required String email,
      required String phone,
      required personalInfo,
      required String filePath}) async {
    //TODO API FOR POST DATA
    Dio dio = GetIt.instance.get<Dio>();
    var tokenCubit = GetIt.instance.get<TokenCubit>();
    try {
      var res = await dio.post('',
          options: Options(headers: {
            'Authorization': 'Bearer ${tokenCubit.user!.token}',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          }),
          data: {
            "name": name,
            "email": email,
            "phone": phone,
            "personal_info": personalInfo,
            "pdf": filePath
          });
        if (res.statusCode ==  200 ) {
          return right('تم ارسال البيانات بنجاح');
        }
        else  {
          return left(ServerFailure(message: res.data['message'] ?? 'Error Fetching data'));
        }
    } on DioException catch (e) {
      return left(ServerFailure(message: e.response?.data['message'] ?? 'Error Fetching data'));
    }
  }
}
