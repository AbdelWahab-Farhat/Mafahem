import 'package:Basera/core/dependency_injection.dart';
import 'package:Basera/core/models/user.dart';
import 'package:Basera/features/Auth/data/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  User? user;
  String? email;
  String? password;
  var formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    var loginService = LoginService(getIt.get<Dio>());
    var result = await loginService.login(email, password);
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.message)),
      (r) {
        user = r;
        emit(LoginSuccess(successMessage: "Login Successful"));
      },
    );
  }
}
