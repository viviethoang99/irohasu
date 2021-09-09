import 'package:intl/intl.dart';

class ConvertDateTime {
  static String dateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm').format(date);
  }
}
