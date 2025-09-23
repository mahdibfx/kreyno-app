import 'package:kreyno/ui/common/app_strings.dart';
import 'package:string_validator/string_validator.dart';

class ValidationService {
  ValidationService._();

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!isEmail(value)) {
      return CommonStrings.emailValidationText;
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (!_isPhoneNumber(value)) {
      return CommonStrings.phoneValidationText;
    } else {
      return null;
    }
  }

  static String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (value.trim().length < 2) {
      return CommonStrings.firstNameValidationText;
    } else {
      return null;
    }
  }

  static String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return CommonStrings.emptyFieldValidationText;
    } else if (value.trim().length < 2) {
      return CommonStrings.lastNameValidationText;
    } else {
      return null;
    }
  }

  static bool _isPhoneNumber(String phone) {
    String pattern = r'^[0-9]{9}$';
    return matches(phone, pattern);
  }
}
