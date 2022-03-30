extension DateTimeExtension on DateTime? {
  String checkLastRead() {
    const toString = 'Đọc ';
    final dateDifferent = DateTime.now().difference(this ?? DateTime.now());
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
