import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/profile_edit/data/take_photo_service.dart';
import 'package:Mafaheem/features/profile_edit/data/update_user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerUserPassword = TextEditingController();
  TextEditingController controllerUserConfirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String imagePath = "";

  EditProfileCubit() : super(EditProfileInitial()) {
    _fillControllers();
  }

  void _fillControllers() {
    var user = GetIt.instance.get<TokenCubit>().user;
    controllerUserName.text = user!.name;
  }

  void changeUserImage() async {
    String? photoPath = await TakePhotoService.takePhoto();
    if (photoPath != null) {
      imagePath = photoPath;
      emit(EditProfileInitial());
    }
  }

  Future<void> validateDataAndSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var result = await UpdateUserService.updateUser(
          controllerUserName.text.trim(),
          imagePath,
          controllerUserPassword.text.trim(),
          controllerUserConfirmPassword.text.trim());
      result.fold(
        (l) => emit(EditProfileFailure(errMessage: l.message)),
        (r) => emit(EditProfileSuccess(message: r)),
      );
    }
  }
}
