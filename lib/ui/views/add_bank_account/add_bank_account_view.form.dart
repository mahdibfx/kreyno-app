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

const String LastNameValueKey = 'lastName';
const String FirstNameValueKey = 'firstName';
const String EmailValueKey = 'email';
const String IbanValueKey = 'iban';
const String ConfirmIbanValueKey = 'confirmIban';
const String CityValueKey = 'city';
const String RegionValueKey = 'region';
const String CountryValueKey = 'country';
const String AddressValueKey = 'address';
const String PostalCodeValueKey = 'postalCode';

final Map<String, TextEditingController>
_AddBankAccountViewTextEditingControllers = {};

final Map<String, FocusNode> _AddBankAccountViewFocusNodes = {};

final Map<String, String? Function(String?)?>
_AddBankAccountViewTextValidations = {
  LastNameValueKey: ValidationService.lastNameValidator,
  FirstNameValueKey: ValidationService.firstNameValidator,
  EmailValueKey: ValidationService.emailValidator,
  IbanValueKey: ValidationService.ibanValidator,
  ConfirmIbanValueKey: ValidationService.ibanValidator,
  CityValueKey: ValidationService.emptyValidator,
  RegionValueKey: ValidationService.emptyValidator,
  CountryValueKey: ValidationService.emptyValidator,
  AddressValueKey: ValidationService.emptyValidator,
  PostalCodeValueKey: ValidationService.emptyValidator,
};

mixin $AddBankAccountView {
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get ibanController =>
      _getFormTextEditingController(IbanValueKey);
  TextEditingController get confirmIbanController =>
      _getFormTextEditingController(ConfirmIbanValueKey);
  TextEditingController get cityController =>
      _getFormTextEditingController(CityValueKey);
  TextEditingController get regionController =>
      _getFormTextEditingController(RegionValueKey);
  TextEditingController get countryController =>
      _getFormTextEditingController(CountryValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get postalCodeController =>
      _getFormTextEditingController(PostalCodeValueKey);

  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get ibanFocusNode => _getFormFocusNode(IbanValueKey);
  FocusNode get confirmIbanFocusNode => _getFormFocusNode(ConfirmIbanValueKey);
  FocusNode get cityFocusNode => _getFormFocusNode(CityValueKey);
  FocusNode get regionFocusNode => _getFormFocusNode(RegionValueKey);
  FocusNode get countryFocusNode => _getFormFocusNode(CountryValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get postalCodeFocusNode => _getFormFocusNode(PostalCodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddBankAccountViewTextEditingControllers.containsKey(key)) {
      return _AddBankAccountViewTextEditingControllers[key]!;
    }

    _AddBankAccountViewTextEditingControllers[key] = TextEditingController(
      text: initialValue,
    );
    return _AddBankAccountViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddBankAccountViewFocusNodes.containsKey(key)) {
      return _AddBankAccountViewFocusNodes[key]!;
    }
    _AddBankAccountViewFocusNodes[key] = FocusNode();
    return _AddBankAccountViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    lastNameController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    ibanController.addListener(() => _updateFormData(model));
    confirmIbanController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    regionController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    postalCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    lastNameController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    ibanController.addListener(() => _updateFormData(model));
    confirmIbanController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    regionController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    postalCodeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap..addAll({
        LastNameValueKey: lastNameController.text,
        FirstNameValueKey: firstNameController.text,
        EmailValueKey: emailController.text,
        IbanValueKey: ibanController.text,
        ConfirmIbanValueKey: confirmIbanController.text,
        CityValueKey: cityController.text,
        RegionValueKey: regionController.text,
        CountryValueKey: countryController.text,
        AddressValueKey: addressController.text,
        PostalCodeValueKey: postalCodeController.text,
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

    for (var controller in _AddBankAccountViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddBankAccountViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddBankAccountViewTextEditingControllers.clear();
    _AddBankAccountViewFocusNodes.clear();
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

  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get ibanValue => this.formValueMap[IbanValueKey] as String?;
  String? get confirmIbanValue =>
      this.formValueMap[ConfirmIbanValueKey] as String?;
  String? get cityValue => this.formValueMap[CityValueKey] as String?;
  String? get regionValue => this.formValueMap[RegionValueKey] as String?;
  String? get countryValue => this.formValueMap[CountryValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get postalCodeValue =>
      this.formValueMap[PostalCodeValueKey] as String?;

  set lastNameValue(String? value) {
    this.setData(this.formValueMap..addAll({LastNameValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      LastNameValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set firstNameValue(String? value) {
    this.setData(this.formValueMap..addAll({FirstNameValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      FirstNameValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(this.formValueMap..addAll({EmailValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(EmailValueKey)) {
      _AddBankAccountViewTextEditingControllers[EmailValueKey]?.text =
          value ?? '';
    }
  }

  set ibanValue(String? value) {
    this.setData(this.formValueMap..addAll({IbanValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(IbanValueKey)) {
      _AddBankAccountViewTextEditingControllers[IbanValueKey]?.text =
          value ?? '';
    }
  }

  set confirmIbanValue(String? value) {
    this.setData(this.formValueMap..addAll({ConfirmIbanValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      ConfirmIbanValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[ConfirmIbanValueKey]?.text =
          value ?? '';
    }
  }

  set cityValue(String? value) {
    this.setData(this.formValueMap..addAll({CityValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(CityValueKey)) {
      _AddBankAccountViewTextEditingControllers[CityValueKey]?.text =
          value ?? '';
    }
  }

  set regionValue(String? value) {
    this.setData(this.formValueMap..addAll({RegionValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(RegionValueKey)) {
      _AddBankAccountViewTextEditingControllers[RegionValueKey]?.text =
          value ?? '';
    }
  }

  set countryValue(String? value) {
    this.setData(this.formValueMap..addAll({CountryValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      CountryValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[CountryValueKey]?.text =
          value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(this.formValueMap..addAll({AddressValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      AddressValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  set postalCodeValue(String? value) {
    this.setData(this.formValueMap..addAll({PostalCodeValueKey: value}));

    if (_AddBankAccountViewTextEditingControllers.containsKey(
      PostalCodeValueKey,
    )) {
      _AddBankAccountViewTextEditingControllers[PostalCodeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasIban =>
      this.formValueMap.containsKey(IbanValueKey) &&
      (ibanValue?.isNotEmpty ?? false);
  bool get hasConfirmIban =>
      this.formValueMap.containsKey(ConfirmIbanValueKey) &&
      (confirmIbanValue?.isNotEmpty ?? false);
  bool get hasCity =>
      this.formValueMap.containsKey(CityValueKey) &&
      (cityValue?.isNotEmpty ?? false);
  bool get hasRegion =>
      this.formValueMap.containsKey(RegionValueKey) &&
      (regionValue?.isNotEmpty ?? false);
  bool get hasCountry =>
      this.formValueMap.containsKey(CountryValueKey) &&
      (countryValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);
  bool get hasPostalCode =>
      this.formValueMap.containsKey(PostalCodeValueKey) &&
      (postalCodeValue?.isNotEmpty ?? false);

  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasIbanValidationMessage =>
      this.fieldsValidationMessages[IbanValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmIbanValidationMessage =>
      this.fieldsValidationMessages[ConfirmIbanValueKey]?.isNotEmpty ?? false;
  bool get hasCityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey]?.isNotEmpty ?? false;
  bool get hasRegionValidationMessage =>
      this.fieldsValidationMessages[RegionValueKey]?.isNotEmpty ?? false;
  bool get hasCountryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasPostalCodeValidationMessage =>
      this.fieldsValidationMessages[PostalCodeValueKey]?.isNotEmpty ?? false;

  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get ibanValidationMessage =>
      this.fieldsValidationMessages[IbanValueKey];
  String? get confirmIbanValidationMessage =>
      this.fieldsValidationMessages[ConfirmIbanValueKey];
  String? get cityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey];
  String? get regionValidationMessage =>
      this.fieldsValidationMessages[RegionValueKey];
  String? get countryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get postalCodeValidationMessage =>
      this.fieldsValidationMessages[PostalCodeValueKey];
}

extension Methods on FormStateHelper {
  void setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  void setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  void setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  void setIbanValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IbanValueKey] = validationMessage;
  void setConfirmIbanValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmIbanValueKey] = validationMessage;
  void setCityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CityValueKey] = validationMessage;
  void setRegionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegionValueKey] = validationMessage;
  void setCountryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CountryValueKey] = validationMessage;
  void setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  void setPostalCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PostalCodeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    lastNameValue = '';
    firstNameValue = '';
    emailValue = '';
    ibanValue = '';
    confirmIbanValue = '';
    cityValue = '';
    regionValue = '';
    countryValue = '';
    addressValue = '';
    postalCodeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      IbanValueKey: getValidationMessage(IbanValueKey),
      ConfirmIbanValueKey: getValidationMessage(ConfirmIbanValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      RegionValueKey: getValidationMessage(RegionValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      PostalCodeValueKey: getValidationMessage(PostalCodeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddBankAccountViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddBankAccountViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      IbanValueKey: getValidationMessage(IbanValueKey),
      ConfirmIbanValueKey: getValidationMessage(ConfirmIbanValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      RegionValueKey: getValidationMessage(RegionValueKey),
      CountryValueKey: getValidationMessage(CountryValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      PostalCodeValueKey: getValidationMessage(PostalCodeValueKey),
    });
