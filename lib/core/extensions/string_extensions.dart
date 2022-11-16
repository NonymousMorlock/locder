extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get title {
    return split(' ').map<String>((e) => e.capitalize()).toList().join(' ');
  }
}
