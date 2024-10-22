import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class TakePhotoService {
  static final ImagePicker _picker = ImagePicker();

  static Future<String?> takePhoto() async {
    try {
      // Pick the image from the gallery
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        return image.path;
      } else {
        return null;
      }
    } catch (e) {
      log('Error picking image: $e');
      return null;
    }
  }
}
