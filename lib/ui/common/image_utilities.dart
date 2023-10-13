import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtilies {
  static Future<String?> galleryImage() async {
    imageCache.clear();
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image1 = await picker.pickImage(
          imageQuality: 50,
          source: ImageSource.gallery,
          maxHeight: 720,
          maxWidth: 1280);
      if (image1 != null) {
        final image = image1.path;

        File file = File(image);
        return base64.encode(file.readAsBytesSync());
      }
    } catch (e) {}
    return null;
  }

  static Future<String?> cameraImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image1 = await picker.pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
          maxHeight: 720,
          maxWidth: 1080);
      if (image1 != null) {
        final image = image1.path;
        File file = File(image);
        return base64.encode(file.readAsBytesSync());
      }
    } catch (e) {}
    return null;
  }

  static String removeImage() {
    return '';
  }
}
