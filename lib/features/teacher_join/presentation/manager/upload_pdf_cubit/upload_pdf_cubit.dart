import 'dart:io';

import 'package:Mafaheem/features/teacher_join/data/upload_pdf_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_pdf_state.dart';

class UploadPdfCubit extends Cubit<UploadPdfState> {
   File? file;
  UploadPdfCubit() : super(UploadPdfInitial());


  void uploadPdf()  async {
    emit(UploadPdfLoading());
    var result = await UploadPdfService.uploadPdf();
        result.fold((failure)  {
          emit(UploadPdfFailure(errMessage: failure.message));
        }, (filePath) {
          file = File(filePath);
          emit(UploadPdfSuccess());
        },);
  }
}
