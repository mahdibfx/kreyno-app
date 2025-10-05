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

  static bool _isPhoneNumber(String phone) {
    String pattern = r'^[0-9]{9}$';
    return matches(phone, pattern);
  }
}
