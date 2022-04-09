extension StringExtension on String {
  String capitalize() {
    return (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }

  String get toId => split('/')[1];
}
