import 'package:Mafaheem/features/Auth/data/rest_password_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
   String? email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordCubit() : super(ForgetPasswordInitial());


  void sendRestPasswordOnEmail() async{
    emit(ForgetPasswordLoading());
    var result = await RestPasswordService(dio: GetIt.instance.get<Dio>()).restPassword(email!);
    result.fold(
      (l) => emit(ForgetPasswordFailure(errMessage: l.message)),
      (r) => emit(ForgetPasswordSuccess())
    );
  }
}
