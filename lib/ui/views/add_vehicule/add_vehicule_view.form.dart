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

const String BrandValueKey = 'brand';
const String ModelValueKey = 'model';
const String ColorValueKey = 'color';
const String Co2EmissionValueKey = 'co2Emission';

final Map<String, TextEditingController>
_AddVehiculeViewTextEditingControllers = {};

final Map<String, FocusNode> _AddVehiculeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddVehiculeViewTextValidations =
    {
      BrandValueKey: ValidationService.vehiculeBrandValidator,
      ModelValueKey: ValidationService.vehiculeModelValidator,
      ColorValueKey: ValidationService.vehiculeColorValidator,
      Co2EmissionValueKey: ValidationService.vehiculeCo2EmissionValidator,
    };

mixin $AddVehiculeView {
  TextEditingController get brandController =>
      _getFormTextEditingController(BrandValueKey);
  TextEditingController get modelController =>
      _getFormTextEditingController(ModelValueKey);
  TextEditingController get colorController =>
      _getFormTextEditingController(ColorValueKey);
  TextEditingController get co2EmissionController =>
      _getFormTextEditingController(Co2EmissionValueKey);

  FocusNode get brandFocusNode => _getFormFocusNode(BrandValueKey);
  FocusNode get modelFocusNode => _getFormFocusNode(ModelValueKey);
  FocusNode get colorFocusNode => _getFormFocusNode(ColorValueKey);
  FocusNode get co2EmissionFocusNode => _getFormFocusNode(Co2EmissionValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddVehiculeViewTextEditingControllers.containsKey(key)) {
      return _AddVehiculeViewTextEditingControllers[key]!;
    }

    _AddVehiculeViewTextEditingControllers[key] = TextEditingController(
      text: initialValue,
    );
    return _AddVehiculeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddVehiculeViewFocusNodes.containsKey(key)) {
      return _AddVehiculeViewFocusNodes[key]!;
    }
    _AddVehiculeViewFocusNodes[key] = FocusNode();
    return _AddVehiculeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    brandController.addListener(() => _updateFormData(model));
    modelController.addListener(() => _updateFormData(model));
    colorController.addListener(() => _updateFormData(model));
    co2EmissionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    brandController.addListener(() => _updateFormData(model));
    modelController.addListener(() => _updateFormData(model));
    colorController.addListener(() => _updateFormData(model));
    co2EmissionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap..addAll({
        BrandValueKey: brandController.text,
        ModelValueKey: modelController.text,
        ColorValueKey: colorController.text,
        Co2EmissionValueKey: co2EmissionController.text,
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

    for (var controller in _AddVehiculeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddVehiculeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddVehiculeViewTextEditingControllers.clear();
    _AddVehiculeViewFocusNodes.clear();
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

  String? get brandValue => this.formValueMap[BrandValueKey] as String?;
  String? get modelValue => this.formValueMap[ModelValueKey] as String?;
  String? get colorValue => this.formValueMap[ColorValueKey] as String?;
  String? get co2EmissionValue =>
      this.formValueMap[Co2EmissionValueKey] as String?;

  set brandValue(String? value) {
    this.setData(this.formValueMap..addAll({BrandValueKey: value}));

    if (_AddVehiculeViewTextEditingControllers.containsKey(BrandValueKey)) {
      _AddVehiculeViewTextEditingControllers[BrandValueKey]?.text = value ?? '';
    }
  }

  set modelValue(String? value) {
    this.setData(this.formValueMap..addAll({ModelValueKey: value}));

    if (_AddVehiculeViewTextEditingControllers.containsKey(ModelValueKey)) {
      _AddVehiculeViewTextEditingControllers[ModelValueKey]?.text = value ?? '';
    }
  }

  set colorValue(String? value) {
    this.setData(this.formValueMap..addAll({ColorValueKey: value}));

    if (_AddVehiculeViewTextEditingControllers.containsKey(ColorValueKey)) {
      _AddVehiculeViewTextEditingControllers[ColorValueKey]?.text = value ?? '';
    }
  }

  set co2EmissionValue(String? value) {
    this.setData(this.formValueMap..addAll({Co2EmissionValueKey: value}));

    if (_AddVehiculeViewTextEditingControllers.containsKey(
      Co2EmissionValueKey,
    )) {
      _AddVehiculeViewTextEditingControllers[Co2EmissionValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasBrand =>
      this.formValueMap.containsKey(BrandValueKey) &&
      (brandValue?.isNotEmpty ?? false);
  bool get hasModel =>
      this.formValueMap.containsKey(ModelValueKey) &&
      (modelValue?.isNotEmpty ?? false);
  bool get hasColor =>
      this.formValueMap.containsKey(ColorValueKey) &&
      (colorValue?.isNotEmpty ?? false);
  bool get hasCo2Emission =>
      this.formValueMap.containsKey(Co2EmissionValueKey) &&
      (co2EmissionValue?.isNotEmpty ?? false);

  bool get hasBrandValidationMessage =>
      this.fieldsValidationMessages[BrandValueKey]?.isNotEmpty ?? false;
  bool get hasModelValidationMessage =>
      this.fieldsValidationMessages[ModelValueKey]?.isNotEmpty ?? false;
  bool get hasColorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey]?.isNotEmpty ?? false;
  bool get hasCo2EmissionValidationMessage =>
      this.fieldsValidationMessages[Co2EmissionValueKey]?.isNotEmpty ?? false;

  String? get brandValidationMessage =>
      this.fieldsValidationMessages[BrandValueKey];
  String? get modelValidationMessage =>
      this.fieldsValidationMessages[ModelValueKey];
  String? get colorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey];
  String? get co2EmissionValidationMessage =>
      this.fieldsValidationMessages[Co2EmissionValueKey];
}

extension Methods on FormStateHelper {
  void setBrandValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BrandValueKey] = validationMessage;
  void setModelValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ModelValueKey] = validationMessage;
  void setColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ColorValueKey] = validationMessage;
  void setCo2EmissionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Co2EmissionValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    brandValue = '';
    modelValue = '';
    colorValue = '';
    co2EmissionValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      BrandValueKey: getValidationMessage(BrandValueKey),
      ModelValueKey: getValidationMessage(ModelValueKey),
      ColorValueKey: getValidationMessage(ColorValueKey),
      Co2EmissionValueKey: getValidationMessage(Co2EmissionValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddVehiculeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddVehiculeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      BrandValueKey: getValidationMessage(BrandValueKey),
      ModelValueKey: getValidationMessage(ModelValueKey),
      ColorValueKey: getValidationMessage(ColorValueKey),
      Co2EmissionValueKey: getValidationMessage(Co2EmissionValueKey),
    });
