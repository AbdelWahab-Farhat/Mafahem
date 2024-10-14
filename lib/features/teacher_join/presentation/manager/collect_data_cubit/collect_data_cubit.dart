import 'dart:io';

import 'package:Basera/core/apis/firebase_upload_api.dart';
import 'package:Basera/core/error/failure.dart';
import 'package:Basera/features/teacher_join/data/send_teacher_data_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'collect_data_state.dart';

class CollectDataCubit extends Cubit<CollectDataState> {
  String name = "";
  String email = "";
  String phone = "";
  String personalInfo = "";
  String filePath = "";
  final formKey = GlobalKey<FormState>();
  CollectDataCubit() : super(CollectDataInitial());

  bool _validateAndSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  Future<void> submitAndSend(final File? uploadedFilePath) async {
    if (uploadedFilePath == null) {
      emit(CollectDataSendingFailure(errMessage: "الرجاء اضافة سيرتك الذاتية"));
      return;
    }
    if (_validateAndSave()) {
      emit(CollectDataSending());
      var path = await GetIt.instance
          .get<FirebaseUploadApi>()
          .uploadAndGetURL(uploadedFilePath);
      path.fold(
        (failure) =>
            emit(CollectDataSendingFailure(errMessage: failure.message)),
        (filePath) {
          this.filePath = filePath;
        },
      );
      var result = await SendTeacherDataService.sendTeacherData(
          name: name,
          email: email,
          phone: phone,
          personalInfo: personalInfo,
          filePath: filePath);
      result.fold(
        (failure) =>
            emit(CollectDataSendingFailure(errMessage: failure.message)),
        (successMessage) =>
            emit(CollectDataSendingSuccess(successMessage: successMessage)),
      );
    }
  }
}
