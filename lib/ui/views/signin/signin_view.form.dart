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

final Map<String, TextEditingController> _SigninViewTextEditingControllers = {};

final Map<String, FocusNode> _SigninViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SigninViewTextValidations = {
  PhoneNumberValueKey: ValidationService.phoneValidator,
};

mixin $SigninView {
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);

  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SigninViewTextEditingControllers.containsKey(key)) {
      return _SigninViewTextEditingControllers[key]!;
    }

    _SigninViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SigninViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SigninViewFocusNodes.containsKey(key)) {
      return _SigninViewFocusNodes[key]!;
    }
    _SigninViewFocusNodes[key] = FocusNode();
    return _SigninViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    phoneNumberController.addListener(() => _updateFormData(model));

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

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PhoneNumberValueKey: phoneNumberController.text,
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

    for (var controller in _SigninViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SigninViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SigninViewTextEditingControllers.clear();
    _SigninViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_SigninViewTextEditingControllers.containsKey(PhoneNumberValueKey)) {
      _SigninViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);

  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;

  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
}

extension Methods on FormStateHelper {
  void setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    phoneNumberValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SigninViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SigninViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
    });
