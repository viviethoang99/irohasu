import 'package:intl/intl.dart';

class ConvertDateTime {
  static String dateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm').format(date);
  }

  static String checkLastRead(DateTime data) {
    final toString = 'Đọc ';
    final dateDifferent = DateTime.now().difference(data);
    if (dateDifferent < const Duration(hours: 1)) {
      return '$toString${dateDifferent.inMinutes} phút trước.';
    } else if (dateDifferent > const Duration(hours: 1) &&
        dateDifferent < const Duration(days: 1)) {
      return '$toString${dateDifferent.inHours} tiếng trước.';
    } else if (dateDifferent > const Duration(days: 1)) {
      return '$toString${dateDifferent.inDays} ngày trước.';
    }
    return toString;
  }
}
