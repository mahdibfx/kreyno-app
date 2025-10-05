// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:kreyno/services/validation_service.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PhoneNumberValueKey = 'phoneNumber';
const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String EmailValueKey = 'email';
const String UserNameValueKey = 'userName';

final Map<String, TextEditingController> _SignupViewTextEditingControllers = {};

final Map<String, FocusNode> _SignupViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SignupViewTextValidations = {
  PhoneNumberValueKey: ValidationService.phoneValidator,
  FirstNameValueKey: ValidationService.firstNameValidator,
  LastNameValueKey: ValidationService.lastNameValidator,
  EmailValueKey: ValidationService.emailValidator,
  UserNameValueKey: ValidationService.emptyValidator,
};

mixin $SignupView {
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get userNameController =>
      _getFormTextEditingController(UserNameValueKey);

  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get userNameFocusNode => _getFormFocusNode(UserNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SignupViewTextEditingControllers.containsKey(key)) {
      return _SignupViewTextEditingControllers[key]!;
    }

    _SignupViewTextEditingControllers[key] = TextEditingController(
      text: initialValue,
    );
    return _SignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignupViewFocusNodes.containsKey(key)) {
      return _SignupViewFocusNodes[key]!;
    }
    _SignupViewFocusNodes[key] = FocusNode();
    return _SignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    userNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    userNameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap..addAll({
        PhoneNumberValueKey: phoneNumberController.text,
        FirstNameValueKey: firstNameController.text,
        LastNameValueKey: lastNameController.text,
        EmailValueKey: emailController.text,
        UserNameValueKey: userNameController.text,
      }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SignupViewTextEditingControllers.clear();
    _SignupViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this.fieldsValidationMessages.values.any(
    (validation) => validation != null,
  );

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get userNameValue => this.formValueMap[UserNameValueKey] as String?;

  set phoneNumberValue(String? value) {
    this.setData(this.formValueMap..addAll({PhoneNumberValueKey: value}));

    if (_SignupViewTextEditingControllers.containsKey(PhoneNumberValueKey)) {
      _SignupViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set firstNameValue(String? value) {
    this.setData(this.formValueMap..addAll({FirstNameValueKey: value}));

    if (_SignupViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _SignupViewTextEditingControllers[FirstNameValueKey]?.text = value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(this.formValueMap..addAll({LastNameValueKey: value}));

    if (_SignupViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _SignupViewTextEditingControllers[LastNameValueKey]?.text = value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(this.formValueMap..addAll({EmailValueKey: value}));

    if (_SignupViewTextEditingControllers.containsKey(EmailValueKey)) {
      _SignupViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set userNameValue(String? value) {
    this.setData(this.formValueMap..addAll({UserNameValueKey: value}));

    if (_SignupViewTextEditingControllers.containsKey(UserNameValueKey)) {
      _SignupViewTextEditingControllers[UserNameValueKey]?.text = value ?? '';
    }
  }

  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasUserName =>
      this.formValueMap.containsKey(UserNameValueKey) &&
      (userNameValue?.isNotEmpty ?? false);

  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasUserNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey]?.isNotEmpty ?? false;

  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get userNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey];
}

extension Methods on FormStateHelper {
  void setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  void setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  void setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  void setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  void setUserNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UserNameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    phoneNumberValue = '';
    firstNameValue = '';
    lastNameValue = '';
    emailValue = '';
    userNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SignupViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SignupViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
