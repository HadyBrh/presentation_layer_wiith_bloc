import 'package:easy_localization/easy_localization.dart';

class DateManager {
  String getCurrentDateFormatted({String format = 'yyyy-MM-dd hh:mm:ss'}) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(format);
    return formatter.format(now);
  }

  String getFormattedDateFromDateTime({String format = 'yyyy-MM-dd', DateTime? dateTime}) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(dateTime!);
  }

  static List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
}
