import 'dart:math';


class StringHelper {
  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

// Capitalise first letter of word
  static String capitaliseFirstLetter(String word) =>
      isNullOrEmpty(word) ? word : word[0].toUpperCase() + word.substring(1);

// Checks if string is null or empty
  static bool isNullOrEmpty(String? text) => text == null || text.trim() == '';

  static String concatAndCapitalise(text1, text2) =>
      '${capitaliseFirstLetter(text1)} ${capitaliseFirstLetter(text2)}';

  static String formatNumber(num amount) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  static double castToDouble(var number) {
    return number == null
        ? 0.0
        : number is double
            ? number
            : number is int
                ? number.toDouble()
                : double.tryParse(number) ?? 0.0;
  }

  static String getVersionNumber(String appVersion) {
    return appVersion.substring(0, 5);
  }
}
