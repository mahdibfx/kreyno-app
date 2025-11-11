import 'package:kreyno/ui/common/app_strings.dart';
import 'package:string_validator/string_validator.dart';

class ValidationService {
  ValidationService._();

  static String? emptyValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!isEmail(trimmedValue)) {
      return CommonStrings.emailValidationText;
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!_isPhoneNumber(trimmedValue)) {
      return CommonStrings.phoneValidationText;
    } else {
      return null;
    }
  }

  static String? firstNameValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!isAlpha(trimmedValue)) {
      return CommonStrings.firstNameInvalidCharactersValidationText;
    } else if (trimmedValue.length < 2) {
      return CommonStrings.firstNameTooShortValidationText;
    } else {
      return null;
    }
  }

  static String? lastNameValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!isAlpha(trimmedValue)) {
      return CommonStrings.lastNameInvalidCharactersValidationText;
    } else if (trimmedValue.length < 2) {
      return CommonStrings.lastNameTooShortValidationText;
    } else {
      return null;
    }
  }

  static String? vehiculeBrandValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (trimmedValue.length < 3) {
      return CommonStrings.brandValidationText;
    } else {
      return null;
    }
  }

  static String? vehiculeModelValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else {
      return null;
    }
  }

  static String? vehiculeColorValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (trimmedValue.length < 3) {
      return CommonStrings.colorValidationText;
    } else {
      return null;
    }
  }

  static String? vehiculeCo2EmissionValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!isNumeric(trimmedValue)) {
      return CommonStrings.co2EmissionValidationText;
    } else {
      return null;
    }
  }

  static String? ibanValidator(String? value) {
    final trimmedValue = value?.trim();
    if (value == null || trimmedValue!.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!_isValidIban(trimmedValue)) {
      return CommonStrings.ibanValidationText;
    } else {
      return null;
    }
  }

  static bool _isPhoneNumber(String phone) {
    String pattern = r'^[0-9]{9}$';
    return matches(phone, pattern);
  }

  static bool _isValidIban(String iban) {
    // Remove all spaces and convert to uppercase
    final cleanIban = iban.replaceAll(RegExp(r'\s+'), '').toUpperCase();

    // Check minimum length (15 for Norway, shortest IBAN)
    if (cleanIban.length < 15) {
      return false;
    }

    // Check basic format: 2 letters (country) + 2 digits (check) + alphanumeric
    if (!matches(cleanIban, r'^[A-Z]{2}[0-9]{2}[A-Z0-9]+$')) {
      return false;
    }

    // Extract country code
    final countryCode = cleanIban.substring(0, 2);

    // Check country-specific length
    final expectedLength = _getIbanLength(countryCode);
    if (expectedLength == null || cleanIban.length != expectedLength) {
      return false;
    }

    // Validate checksum using MOD-97
    return _validateIbanChecksum(cleanIban);
  }

  static int? _getIbanLength(String countryCode) {
    // SEPA zone countries with their IBAN lengths
    const ibanLengths = <String, int>{
      'AD': 24, // Andorra
      'AT': 20, // Austria
      'BE': 16, // Belgium
      'BG': 22, // Bulgaria
      'CH': 21, // Switzerland
      'CY': 28, // Cyprus
      'CZ': 24, // Czech Republic
      'DE': 22, // Germany
      'DK': 18, // Denmark
      'EE': 20, // Estonia
      'ES': 24, // Spain
      'FI': 18, // Finland
      'FR': 27, // France
      'GB': 22, // United Kingdom
      'GR': 27, // Greece
      'HR': 21, // Croatia
      'HU': 28, // Hungary
      'IE': 22, // Ireland
      'IS': 26, // Iceland
      'IT': 27, // Italy
      'LI': 21, // Liechtenstein
      'LT': 20, // Lithuania
      'LU': 20, // Luxembourg
      'LV': 21, // Latvia
      'MC': 27, // Monaco
      'MT': 31, // Malta
      'NL': 18, // Netherlands
      'NO': 15, // Norway
      'PL': 28, // Poland
      'PT': 25, // Portugal
      'RO': 24, // Romania
      'SE': 24, // Sweden
      'SI': 19, // Slovenia
      'SK': 24, // Slovakia
      'SM': 27, // San Marino
      'VA': 22, // Vatican City
    };

    return ibanLengths[countryCode];
  }

  static bool _validateIbanChecksum(String iban) {
    // Move first 4 characters to the end
    final rearranged = iban.substring(4) + iban.substring(0, 4);

    // Replace letters with numbers (A=10, B=11, ..., Z=35)
    final numericString = rearranged.split('').map((char) {
      final code = char.codeUnitAt(0);
      // If it's a letter (A-Z)
      if (code >= 65 && code <= 90) {
        return (code - 55).toString(); // A=65 -> 10, B=66 -> 11, etc.
      }
      // If it's a digit, keep it as is
      return char;
    }).join();

    // Calculate MOD 97 using BigInt to handle large numbers
    try {
      final number = BigInt.parse(numericString);
      final remainder = number % BigInt.from(97);
      return remainder == BigInt.one;
    } catch (e) {
      return false;
    }
  }
}
