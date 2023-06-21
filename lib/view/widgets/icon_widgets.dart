import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

Widget getFileIcon(String filePath) {
  final extension = path.extension(filePath).toLowerCase();
  if (extension == '.pdf') {
    return const Icon(
      Icons.picture_as_pdf,
      size: 100,
      color: Colors.white,
    );
  } else if (extension == '.png' ||
      extension == '.jpg' ||
      extension == '.jpeg') {
    return const Icon(
      Icons.image,
      size: 100,
      color: Colors.white,
    );
  } else if (extension == '.xlsx') {
    return const Icon(
      Icons.description,
      size: 100,
      color: Colors.white,
    );
  } else {
    return const Icon(
      Icons.insert_drive_file,
      size: 100,
      color: Colors.white,
    );
  }
}
