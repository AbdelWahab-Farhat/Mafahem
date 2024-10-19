import 'package:Mafaheem/core/dependency_injection.dart';
import 'package:Mafaheem/features/Auth/data/register_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  var formKey = GlobalKey<FormState>();
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(String userName, String email, String password,
      String confirmPassword) async {
    emit(RegisterLoading());
    var registerService = RegisterService(getIt.get<Dio>());
    var result = await registerService.register(
        userName, email, password, confirmPassword);
    result.fold(
      (l) => emit(RegisterFailure(errMessage: l.message)),
      (r) {
        emit(RegisterSuccess(successMessage: r));
      },
    );
  }
}
