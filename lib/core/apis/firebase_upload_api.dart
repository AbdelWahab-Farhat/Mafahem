import 'dart:io';
import 'package:Basera/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseUploadApi {
  Future<Either<Failure, String>> uploadAndGetURL(File file) async {
    try {
      // Create a reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('uploads/${file.path.split('/').last}');

      // Start uploading the file
      UploadTask uploadTask = storageRef.putFile(file);

      // Await the completion of the upload
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL of the uploaded file
      final String downloadURL = await snapshot.ref.getDownloadURL();

      // Return the download URL in case of success
      return right(downloadURL);
    } catch (e) {

      return left(FirebaseFailure(message: e.toString()));
    }
  }
}

