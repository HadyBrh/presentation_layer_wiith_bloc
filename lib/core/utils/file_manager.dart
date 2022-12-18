import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> zipFiles({
    required String zipFileName,
    required List<File> fileToZips,
  }) async {
    final ZipFileEncoder encoder = ZipFileEncoder();

    Directory appDocDirectory =
        await getApplicationDocumentsDirectory(); //await getExternalStorageDirectory()

    // Manually create a zip at the zipFilePath
    final String zipFilePath = join(appDocDirectory.path, zipFileName);

    /// delete old zip file if exist
    if (File(zipFilePath).existsSync()) {
      File(zipFilePath).deleteSync();
    }

    encoder.create(zipFilePath);

    // Add all the files to the zip file
    for (final File fileToZip in fileToZips) {
      encoder.addFile(fileToZip);
    }

    encoder.close();

    return zipFilePath;
  }

  Future<File> changeFileName(
      {required File file, required String newFileName}) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }
}
