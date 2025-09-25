// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SelectedDayValueKey = 'selectedDay';
const String SelectedMonthValueKey = 'selectedMonth';
const String SelectedYearValueKey = 'selectedYear';

final Map<String, TextEditingController>
_BirthDatePickerFieldTextEditingControllers = {};

final Map<String, FocusNode> _BirthDatePickerFieldFocusNodes = {};

final Map<String, String? Function(String?)?>
_BirthDatePickerFieldTextValidations = {
  SelectedDayValueKey: null,
  SelectedMonthValueKey: null,
  SelectedYearValueKey: null,
};

mixin $BirthDatePickerField {
  TextEditingController get selectedDayController =>
      _getFormTextEditingController(SelectedDayValueKey);
  TextEditingController get selectedMonthController =>
      _getFormTextEditingController(SelectedMonthValueKey);
  TextEditingController get selectedYearController =>
      _getFormTextEditingController(SelectedYearValueKey);

  FocusNode get selectedDayFocusNode => _getFormFocusNode(SelectedDayValueKey);
  FocusNode get selectedMonthFocusNode =>
      _getFormFocusNode(SelectedMonthValueKey);
  FocusNode get selectedYearFocusNode =>
      _getFormFocusNode(SelectedYearValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BirthDatePickerFieldTextEditingControllers.containsKey(key)) {
      return _BirthDatePickerFieldTextEditingControllers[key]!;
    }

    _BirthDatePickerFieldTextEditingControllers[key] = TextEditingController(
      text: initialValue,
    );
    return _BirthDatePickerFieldTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BirthDatePickerFieldFocusNodes.containsKey(key)) {
      return _BirthDatePickerFieldFocusNodes[key]!;
    }
    _BirthDatePickerFieldFocusNodes[key] = FocusNode();
    return _BirthDatePickerFieldFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    selectedDayController.addListener(() => _updateFormData(model));
    selectedMonthController.addListener(() => _updateFormData(model));
    selectedYearController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    selectedDayController.addListener(() => _updateFormData(model));
    selectedMonthController.addListener(() => _updateFormData(model));
    selectedYearController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap..addAll({
        SelectedDayValueKey: selectedDayController.text,
        SelectedMonthValueKey: selectedMonthController.text,
        SelectedYearValueKey: selectedYearController.text,
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

    for (var controller in _BirthDatePickerFieldTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BirthDatePickerFieldFocusNodes.values) {
      focusNode.dispose();
    }

    _BirthDatePickerFieldTextEditingControllers.clear();
    _BirthDatePickerFieldFocusNodes.clear();
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

  String? get selectedDayValue =>
      this.formValueMap[SelectedDayValueKey] as String?;
  String? get selectedMonthValue =>
      this.formValueMap[SelectedMonthValueKey] as String?;
  String? get selectedYearValue =>
      this.formValueMap[SelectedYearValueKey] as String?;

  set selectedDayValue(String? value) {
    this.setData(this.formValueMap..addAll({SelectedDayValueKey: value}));

    if (_BirthDatePickerFieldTextEditingControllers.containsKey(
      SelectedDayValueKey,
    )) {
      _BirthDatePickerFieldTextEditingControllers[SelectedDayValueKey]?.text =
          value ?? '';
    }
  }

  set selectedMonthValue(String? value) {
    this.setData(this.formValueMap..addAll({SelectedMonthValueKey: value}));

    if (_BirthDatePickerFieldTextEditingControllers.containsKey(
      SelectedMonthValueKey,
    )) {
      _BirthDatePickerFieldTextEditingControllers[SelectedMonthValueKey]?.text =
          value ?? '';
    }
  }

  set selectedYearValue(String? value) {
    this.setData(this.formValueMap..addAll({SelectedYearValueKey: value}));

    if (_BirthDatePickerFieldTextEditingControllers.containsKey(
      SelectedYearValueKey,
    )) {
      _BirthDatePickerFieldTextEditingControllers[SelectedYearValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSelectedDay =>
      this.formValueMap.containsKey(SelectedDayValueKey) &&
      (selectedDayValue?.isNotEmpty ?? false);
  bool get hasSelectedMonth =>
      this.formValueMap.containsKey(SelectedMonthValueKey) &&
      (selectedMonthValue?.isNotEmpty ?? false);
  bool get hasSelectedYear =>
      this.formValueMap.containsKey(SelectedYearValueKey) &&
      (selectedYearValue?.isNotEmpty ?? false);

  bool get hasSelectedDayValidationMessage =>
      this.fieldsValidationMessages[SelectedDayValueKey]?.isNotEmpty ?? false;
  bool get hasSelectedMonthValidationMessage =>
      this.fieldsValidationMessages[SelectedMonthValueKey]?.isNotEmpty ?? false;
  bool get hasSelectedYearValidationMessage =>
      this.fieldsValidationMessages[SelectedYearValueKey]?.isNotEmpty ?? false;

  String? get selectedDayValidationMessage =>
      this.fieldsValidationMessages[SelectedDayValueKey];
  String? get selectedMonthValidationMessage =>
      this.fieldsValidationMessages[SelectedMonthValueKey];
  String? get selectedYearValidationMessage =>
      this.fieldsValidationMessages[SelectedYearValueKey];
}

extension Methods on FormStateHelper {
  void setSelectedDayValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SelectedDayValueKey] = validationMessage;
  void setSelectedMonthValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SelectedMonthValueKey] = validationMessage;
  void setSelectedYearValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SelectedYearValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    selectedDayValue = '';
    selectedMonthValue = '';
    selectedYearValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SelectedDayValueKey: getValidationMessage(SelectedDayValueKey),
      SelectedMonthValueKey: getValidationMessage(SelectedMonthValueKey),
      SelectedYearValueKey: getValidationMessage(SelectedYearValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BirthDatePickerFieldTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BirthDatePickerFieldTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      SelectedDayValueKey: getValidationMessage(SelectedDayValueKey),
      SelectedMonthValueKey: getValidationMessage(SelectedMonthValueKey),
      SelectedYearValueKey: getValidationMessage(SelectedYearValueKey),
    });
