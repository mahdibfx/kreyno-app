import 'package:easy_localization/easy_localization.dart';
import 'package:kreyno/models/wallet_history.dart';

// Custom class to handle the dynamic Map structure with localized keys
class TransactionData {
  final Map<String, List<WalletHistory>> transactionsByMonth;

  const TransactionData({required this.transactionsByMonth});

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    final Map<String, List<WalletHistory>> result = {};

    json.forEach((key, value) {
      if (value is List) {
        // Transform the key from "mm-yyyy" to localized "Month YYYY"
        final localizedKey = _transformKeyToLocalized(key);
        result[localizedKey] = value
            .map((item) => WalletHistory.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    });

    return TransactionData(transactionsByMonth: result);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};

    transactionsByMonth.forEach((key, value) {
      // Transform back from localized "Month YYYY" to "mm-yyyy"
      final originalKey = _transformKeyFromLocalized(key);
      result[originalKey] = value.map((item) => item.toJson()).toList();
    });

    return result;
  }

  // Transform "mm-yyyy" to localized "Month YYYY"
  static String _transformKeyToLocalized(String key) {
    try {
      final parts = key.split('-');
      if (parts.length != 2) return key;

      final month = int.parse(parts[0]);
      final year = parts[1];

      // Get localized month name using your existing translations
      final monthNames = [
        'common.months.january', // 01
        'common.months.february', // 02
        'common.months.march', // 03
        'common.months.april', // 04
        'common.months.may', // 05
        'common.months.june', // 06
        'common.months.july', // 07
        'common.months.august', // 08
        'common.months.september', // 09
        'common.months.october', // 10
        'common.months.november', // 11
        'common.months.december', // 12
      ];

      if (month >= 1 && month <= 12) {
        final localizedMonth = monthNames[month - 1].tr();
        return '$localizedMonth $year';
      }

      return key;
    } catch (e) {
      return key;
    }
  }

  // Transform localized "Month YYYY" back to "mm-yyyy"
  static String _transformKeyFromLocalized(String key) {
    try {
      final parts = key.split(' ');
      if (parts.length != 2) return key;

      final monthName = parts[0];
      final year = parts[1];

      // Find month number from localized name
      final monthNames = [
        'common.months.january',
        'common.months.february',
        'common.months.march',
        'common.months.april',
        'common.months.may',
        'common.months.june',
        'common.months.july',
        'common.months.august',
        'common.months.september',
        'common.months.october',
        'common.months.november',
        'common.months.december',
      ];

      for (int i = 0; i < monthNames.length; i++) {
        if (monthNames[i].tr() == monthName) {
          final monthNumber = (i + 1).toString().padLeft(2, '0');
          return '$monthNumber-$year';
        }
      }

      return key;
    } catch (e) {
      return key;
    }
  }
}
