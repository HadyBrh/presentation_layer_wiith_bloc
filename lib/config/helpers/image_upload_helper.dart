import 'dart:io';
import 'dart:math';

class ImageUploadHelper {
  static Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = File('$tempPath${rng.nextInt(100)}.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }

  static Future<File> compressImageFile(File tmpFile) async {
    final filePath = tmpFile.absolute.path;
    final lastIndex =
        filePath.lastIndexOf(RegExp(r'.jpg|.jpeg|.gif|.png|.bmp'));
    final split = filePath.substring(0, (lastIndex));
    final fileExtension = filePath.substring(lastIndex, filePath.length);
    final format = fileExtension == '.jpg' || fileExtension == '.jpeg'
        ? CompressFormat.jpeg
        : CompressFormat.png;
    final outPath = "${split}_out${filePath.substring(lastIndex)}";
    final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath, outPath,
        quality: 50, format: format);
    return compressedImage!;
  }
}
