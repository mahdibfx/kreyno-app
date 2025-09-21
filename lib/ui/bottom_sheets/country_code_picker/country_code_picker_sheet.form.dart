// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SearchValueKey = 'search';

final Map<String, TextEditingController>
_CountryCodePickerSheetTextEditingControllers = {};

final Map<String, FocusNode> _CountryCodePickerSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
_CountryCodePickerSheetTextValidations = {SearchValueKey: null};

mixin $CountryCodePickerSheet {
  TextEditingController get searchController =>
      _getFormTextEditingController(SearchValueKey);

  FocusNode get searchFocusNode => _getFormFocusNode(SearchValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CountryCodePickerSheetTextEditingControllers.containsKey(key)) {
      return _CountryCodePickerSheetTextEditingControllers[key]!;
    }

    _CountryCodePickerSheetTextEditingControllers[key] = TextEditingController(
      text: initialValue,
    );
    return _CountryCodePickerSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CountryCodePickerSheetFocusNodes.containsKey(key)) {
      return _CountryCodePickerSheetFocusNodes[key]!;
    }
    _CountryCodePickerSheetFocusNodes[key] = FocusNode();
    return _CountryCodePickerSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    searchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap..addAll({SearchValueKey: searchController.text}),
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

    for (var controller
        in _CountryCodePickerSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CountryCodePickerSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _CountryCodePickerSheetTextEditingControllers.clear();
    _CountryCodePickerSheetFocusNodes.clear();
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

  String? get searchValue => this.formValueMap[SearchValueKey] as String?;

  set searchValue(String? value) {
    this.setData(this.formValueMap..addAll({SearchValueKey: value}));

    if (_CountryCodePickerSheetTextEditingControllers.containsKey(
      SearchValueKey,
    )) {
      _CountryCodePickerSheetTextEditingControllers[SearchValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearch =>
      this.formValueMap.containsKey(SearchValueKey) &&
      (searchValue?.isNotEmpty ?? false);

  bool get hasSearchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey]?.isNotEmpty ?? false;

  String? get searchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey];
}

extension Methods on FormStateHelper {
  void setSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchValueKey: getValidationMessage(SearchValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CountryCodePickerSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CountryCodePickerSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) => model.setValidationMessages(
  {SearchValueKey: getValidationMessage(SearchValueKey)},
);
