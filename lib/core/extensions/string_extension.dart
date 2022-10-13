extension StringExtension on String {
  String capitalize() {
    return (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }

  String get toId => split('/')[1];

  String slice(int start, [int end = -1]) {
    final kStart = start < 0 ? start + length : start;
    final kEnd = end < 0 ? end + length : end;

    RangeError.checkValidRange(kStart, kEnd, length);

    return substring(kStart, kEnd + 1);
  }
}
