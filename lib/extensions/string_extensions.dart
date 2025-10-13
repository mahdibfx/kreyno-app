extension StringExtensions on String {
  /// Formats a registration number as "XX-XXX-XX"
  /// Example: "AB12345" becomes "AB-123-45"
  String formatRegistrationNumber() {
    final cleanString = replaceAll(RegExp(r'[-\s]'), '');

    if (cleanString.length < 7) {
      return this;
    }

    if (cleanString.length >= 7) {
      return '${cleanString.substring(0, 2)}-${cleanString.substring(2, 5)}-${cleanString.substring(5, 7)}';
    }

    return this;
  }
}
