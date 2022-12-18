import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:salesman_mobile/core/services/permission.dart';
import 'package:salesman_mobile/core/utils/file_manager.dart';

class ImageHelper {
  Future<File?> optimizeImageFile(File tmpFile) async {
    final filePath = tmpFile.absolute.path;
    final lastIndex =
        filePath.lastIndexOf(new RegExp(r'.jpg|.jpeg|.gif|.png|.bmp'));
    final splitted = filePath.substring(0, (lastIndex));
    final fileExtension = filePath.substring(lastIndex, filePath.length);
    final format = fileExtension == '.jpg' || fileExtension == '.jpeg'
        ? CompressFormat.jpeg
        : CompressFormat.png;
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    final optimizedImage = await FlutterImageCompress.compressAndGetFile(
        filePath, outPath,
        quality: 70, format: format);
    return optimizedImage;
  }

  Future pickImage(ImageSource imageSource, File? image) async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    // Let user select photo from gallery
    if (imageSource == ImageSource.gallery &&
        await PermissionHandler().checkAndRequestStoragePermissions()) {
      pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else if (imageSource == ImageSource.camera &&
        await PermissionHandler().checkAndRequestCameraPermissions()) {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
    }

    if (pickedFile == null) return;

    // Rename Picked file
    final fileExtension = extension(pickedFile.path);

    DateTime nowDate = DateTime.now();
    String dateTimeString =
        '${nowDate.year}${nowDate.month}${nowDate.day}${nowDate.hour}${nowDate.minute}${nowDate.second}${nowDate.millisecond}';
    File renamedFile = await FileManager().changeFileName(
      file: File(pickedFile.path),
      newFileName: '$dateTimeString$fileExtension',
    );

    return renamedFile;
  }
}
