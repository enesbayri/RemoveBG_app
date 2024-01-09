// ignore_for_file: unused_catch_clause

import 'dart:io';

import 'package:uuid/uuid.dart';

class FileDownload {
  static Future<File> moveFile(File sourceFile) async {
    String newPath = "/storage/emulated/0/Download/no-bg${Uuid().v4()}.png";
    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException catch (e) {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }
}
