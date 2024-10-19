import 'dart:developer';
import 'package:Mafaheem/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

class UploadPdfService {
  static Future<Either<Failure, String>> uploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      log(result.files.single.path!);
      return right(result.files.single.path!);
    } else {
      return left(CancelledFailure(message: 'Cancelled'));
    }
  }
}