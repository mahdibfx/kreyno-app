import 'package:easy_localization/easy_localization.dart';

class CommonStrings {
  const CommonStrings._();

  static const String appName = 'KREYNO';
  static String get continueLabel => 'common.continue'.tr();
  static String get optional => 'common.optional'.tr();
  static String get delete => 'common.delete'.tr();
  static String get save => 'common.save'.tr();
  static String get takePicture => 'common.takePicture'.tr();
  static String get pickFromGallery => 'common.pickFromGallery'.tr();
  static String get skip => 'common.skip'.tr();
  static String get validTill => 'common.validTill'.tr();
  static String get complete => 'common.complete'.tr();
  static String get error => 'common.error'.tr();
  static String get retry => 'common.retry'.tr();

  // Months
  static String get january => 'common.months.january'.tr();
  static String get february => 'common.months.february'.tr();
  static String get march => 'common.months.march'.tr();
  static String get april => 'common.months.april'.tr();
  static String get may => 'common.months.may'.tr();
  static String get june => 'common.months.june'.tr();
  static String get july => 'common.months.july'.tr();
  static String get august => 'common.months.august'.tr();
  static String get september => 'common.months.september'.tr();
  static String get october => 'common.months.october'.tr();
  static String get november => 'common.months.november'.tr();
  static String get december => 'common.months.december'.tr();

  // Validation
  static String get emptyFieldValidationText =>
      'common.validation.emptyField'.tr();
  static String get emailValidationText => 'common.validation.email'.tr();
  static String get phoneValidationText => 'common.validation.phone'.tr();
  static String get firstNameValidationText =>
      'common.validation.firstName'.tr();
  static String get lastNameValidationText => 'common.validation.lastName'.tr();
  static String get brandValidationText => 'common.validation.brand'.tr();
  static String get modelValidationText => 'common.validation.model'.tr();
  static String get colorValidationText => 'common.validation.color'.tr();
  static String get co2EmissionValidationText =>
      'common.validation.co2Emission'.tr();
  static String get firstNameInvalidCharactersValidationText =>
      'common.validation.firstNameInvalidCharacters'.tr();
  static String get firstNameTooShortValidationText =>
      'common.validation.firstNameTooShort'.tr();
  static String get lastNameInvalidCharactersValidationText =>
      'common.validation.lastNameInvalidCharacters'.tr();
  static String get lastNameTooShortValidationText =>
      'common.validation.lastNameTooShort'.tr();

  // otp success
  static String get codeSentTitle => 'common.otpSuccess.codeSentTitle'.tr();
  static String get codeSentDescription =>
      'common.otpSuccess.codeSentDescription'.tr();
}

class SetUpLanguageStrings {
  const SetUpLanguageStrings._();

  static String get title => 'setUpLanguage.title'.tr();
}

class OnboardingStrings {
  const OnboardingStrings._();

  static String get tagLine => 'onboarding.tagLine'.tr();
  static String get buttonLabel => 'onboarding.buttonLabel'.tr();
}

class CountryCodePickerStrings {
  const CountryCodePickerStrings._();

  static String get title => 'countryCodePicker.title'.tr();
  static String get search => 'countryCodePicker.search'.tr();
  static String get noCountriesFound =>
      'countryCodePicker.noCountriesFound'.tr();
  static String get trySearchingWithDifferentTerm =>
      'countryCodePicker.trySearchingWithDifferentTerm'.tr();
}

class SigninStrings {
  const SigninStrings._();

  static String get title => 'signin.title'.tr();
  static String get description => 'signin.description'.tr();
  static String get phoneNumber => 'signin.phoneNumber'.tr();
  static String get phoneNumberPlaceholder =>
      'signin.phoneNumberPlaceholder'.tr();
  static String get buttonLabel => 'signin.buttonLabel'.tr();
}

class OtpStrings {
  const OtpStrings._();

  static String get title => 'otp.title'.tr();
  static String get description => 'otp.description'.tr();
  static String get codeNotReceived => 'otp.codeNotReceived'.tr();
  static String get resendCodeIn => 'otp.resendCodeIn'.tr();
  static String get resendCode => 'otp.resendCode'.tr();
}

class SignupStrings {
  const SignupStrings._();

  static String get title => 'signup.title'.tr();
  static String get phoneNumber => 'signup.phoneNumber'.tr();
  static String get phoneNumberPlaceholder =>
      'signup.phoneNumberPlaceholder'.tr();
  static String get firstName => 'signup.firstName'.tr();
  static String get firstNamePlaceholder => 'signup.firstNamePlaceholder'.tr();
  static String get lastName => 'signup.lastName'.tr();
  static String get lastNamePlaceholder => 'signup.lastNamePlaceholder'.tr();
  static String get userName => 'signup.userName'.tr();
  static String get userNamePlaceholder => 'signup.userNamePlaceholder'.tr();
  static String get email => 'signup.email'.tr();
  static String get emailPlaceholder => 'signup.emailPlaceholder'.tr();
  static String get address => 'signup.address'.tr();
  static String get addressPlaceholder => 'signup.addressPlaceholder'.tr();
  static String get birthday => 'signup.birthday'.tr();
  static String get day => 'signup.day'.tr();
  static String get month => 'signup.month'.tr();
  static String get year => 'signup.year'.tr();
  static String get gender => 'signup.gender'.tr();
  static String get male => 'signup.male'.tr();
  static String get female => 'signup.female'.tr();
  static String get userNameTaken => 'signup.userNameTaken'.tr();
  static String get emailTaken => 'signup.emailTaken'.tr();
}

class SetUpVehiculeStrings {
  const SetUpVehiculeStrings._();

  static String get title => 'setUpVehicule.title'.tr();
  static String get description => 'setUpVehicule.description'.tr();
  static String get autoFill => 'setUpVehicule.autoFill'.tr();
  static String get frenchLicensePlate =>
      'setUpVehicule.frenchLicensePlate'.tr();
  static String get licensePlate => 'setUpVehicule.licensePlate'.tr();
  static String get licensePlatePlaceholder =>
      'setUpVehicule.licensePlatePlaceholder'.tr();
  static String get vehicleBrand => 'setUpVehicule.vehicleBrand'.tr();
  static String get vehicleBrandPlaceholder =>
      'setUpVehicule.vehicleBrandPlaceholder'.tr();
  static String get vehicleModel => 'setUpVehicule.vehicleModel'.tr();
  static String get vehicleModelPlaceholder =>
      'setUpVehicule.vehicleModelPlaceholder'.tr();
  static String get color => 'setUpVehicule.color'.tr();
  static String get colorPlaceholder => 'setUpVehicule.colorPlaceholder'.tr();
  static String get co2Emission => 'setUpVehicule.co2Emission'.tr();
  static String get co2EmissionPlaceholder =>
      'setUpVehicule.co2EmissionPlaceholder'.tr();
  static String get vehiculeImage => 'setUpVehicule.vehiculeImage'.tr();
  static String get vehiculeType => 'setUpVehicule.vehiculeType'.tr();
  static String get vehiculeTypePlaceholder =>
      'setUpVehicule.vehiculeTypePlaceholder'.tr();
  static String get gasVehicle => 'setUpVehicule.gasVehicle'.tr();
  static String get electricVehicle => 'setUpVehicule.electricVehicle'.tr();
  static String get scooter => 'setUpVehicule.scooter'.tr();
  static String get uploading => 'setUpVehicule.uploading'.tr();
  static String get deleting => 'setUpVehicule.deleting'.tr();
  static String get errorRetry => 'setUpVehicule.errorRetry'.tr();
  static String get saveVehicleToMoveToNextStep =>
      'setUpVehicule.saveVehicleToMoveToNextStep'.tr();
  static String get deleteImageDialogTitle =>
      'setUpVehicule.deleteImageDialogTitle'.tr();
  static String get deleteImageDialogDescription =>
      'setUpVehicule.deleteImageDialogDescription'.tr();
  static String get deleteImageDialogSecondaryButtonTitle =>
      'setUpVehicule.deleteImageDialogSecondaryButtonTitle'.tr();
  static String get deleteImageDialogMainButtonTitle =>
      'setUpVehicule.deleteImageDialogMainButtonTitle'.tr();
  static String get vehiculeSavedSuccessfully =>
      'setUpVehicule.vehiculeSavedSuccessfully'.tr();
  static String get acceptedFormats => 'setUpVehicule.acceptedFormats'.tr();
}

class PickVehiculeImageStrings {
  const PickVehiculeImageStrings._();

  static String get title => 'pickVehiculeImage.title'.tr();
  static String get description => 'pickVehiculeImage.description'.tr();
  static String get recommendedImage =>
      'pickVehiculeImage.recommendedImage'.tr();
  static String get hintTitle => 'pickVehiculeImage.hintTitle'.tr();
  static String get hintDescription => 'pickVehiculeImage.hintDescription'.tr();
  static String get fileDoesNotExist =>
      'pickVehiculeImage.fileDoesNotExist'.tr();
  static String get fileSizeExceedsMaximumAllowedSize =>
      'pickVehiculeImage.fileSizeExceedsMaximumAllowedSize'.tr();
  static String get fileFormatNotSupported =>
      'pickVehiculeImage.fileFormatNotSupported'.tr();
}

class SetUpPaymentMethodsStrings {
  const SetUpPaymentMethodsStrings._();

  static String get title => 'setUpPaymentMethods.title'.tr();
  static String get description => 'setUpPaymentMethods.description'.tr();
  static String get buttonLabel => 'setUpPaymentMethods.buttonLabel'.tr();
  static String get paymentMethodsDescription =>
      'setUpPaymentMethods.paymentMethodsDescription'.tr();
  static String get savePaymentMethodsToMoveToNextStep =>
      'setUpPaymentMethods.savePaymentMethodsToMoveToNextStep'.tr();
  static String get cardAddedSuccessfully =>
      'setUpPaymentMethods.cardAddedSuccessfully'.tr();
  static String get saveCard => 'setUpPaymentMethods.saveCard'.tr();
}

class SetUpPermissionsStrings {
  const SetUpPermissionsStrings._();

  static String get title => 'setUpPermissions.title'.tr();
  static String get description => 'setUpPermissions.description'.tr();
  static String get locationPermissionTitle =>
      'setUpPermissions.locationPermissionTitle'.tr();
  static String get locationPermissionDescription =>
      'setUpPermissions.locationPermissionDescription'.tr();
  static String get notificationPermissionTitle =>
      'setUpPermissions.notificationPermissionTitle'.tr();
  static String get notificationPermissionDescription =>
      'setUpPermissions.notificationPermissionDescription'.tr();
  static String get authorize => 'setUpPermissions.authorize'.tr();
}

class ApiErrorStrings {
  const ApiErrorStrings._();

  static String get requestFailed => 'apiErrors.requestFailed'.tr();
  static String get unexpectedError => 'apiErrors.unexpectedError'.tr();
  static String get connectionTimeout => 'apiErrors.connectionTimeout'.tr();
  static String get requestTimeout => 'apiErrors.requestTimeout'.tr();
  static String get serverResponseTimeout =>
      'apiErrors.serverResponseTimeout'.tr();
  static String get requestCancelled => 'apiErrors.requestCancelled'.tr();
  static String get connectionError => 'apiErrors.connectionError'.tr();
  static String get certificateError => 'apiErrors.certificateError'.tr();
  static String get badRequest => 'apiErrors.badRequest'.tr();
  static String get authenticationFailed =>
      'apiErrors.authenticationFailed'.tr();
  static String get accessDenied => 'apiErrors.accessDenied'.tr();
  static String get resourceNotFound => 'apiErrors.resourceNotFound'.tr();
  static String get conflictError => 'apiErrors.conflictError'.tr();
  static String get invalidData => 'apiErrors.invalidData'.tr();
  static String get tooManyRequests => 'apiErrors.tooManyRequests'.tr();
  static String get internalServerError => 'apiErrors.internalServerError'.tr();
  static String get badGateway => 'apiErrors.badGateway'.tr();
  static String get serviceUnavailable => 'apiErrors.serviceUnavailable'.tr();
  static String get gatewayTimeout => 'apiErrors.gatewayTimeout'.tr();
  static String get serverError => 'apiErrors.serverError'.tr();
}

class ProfileSheetStrings {
  const ProfileSheetStrings._();

  static String get accountSettings => 'profileSheet.accountSettings'.tr();
  static String get myVehicles => 'profileSheet.myVehicles'.tr();
  static String get myParkingSpots => 'profileSheet.myParkingSpots'.tr();
  static String get walletKreyno => 'profileSheet.walletKreyno'.tr();
  static String get paymentMethods => 'profileSheet.paymentMethods'.tr();
  static String get conditionsOfUse => 'profileSheet.conditionsOfUse'.tr();
  static String get privacyPolicy => 'profileSheet.privacyPolicy'.tr();
  static String get logout => 'profileSheet.logout'.tr();
  static String get changeLanguage => 'profileSheet.changeLanguage'.tr();
}

class LogoutConfirmationStrings {
  const LogoutConfirmationStrings._();

  static String get title => 'logoutConfirmation.title'.tr();
  static String get description => 'logoutConfirmation.description'.tr();
  static String get buttonLabel => 'logoutConfirmation.buttonLabel'.tr();
}

class DeleteAccountConfirmationStrings {
  const DeleteAccountConfirmationStrings._();

  static String get title => 'deleteAccountConfirmation.title'.tr();
  static String get description => 'deleteAccountConfirmation.description'.tr();
  static String get buttonLabel => 'deleteAccountConfirmation.buttonLabel'.tr();
}

class AccountSettingsStrings {
  const AccountSettingsStrings._();

  static String get title => 'accountSettings.title'.tr();
  static String get personalInformation =>
      'accountSettings.personalInformation'.tr();
  static String get changePhoneNumber =>
      'accountSettings.changePhoneNumber'.tr();
  static String get deleteAccount => 'accountSettings.deleteAccount'.tr();
  static String get youJoinedKreynoOn =>
      'accountSettings.youJoinedKreynoOn'.tr();
}

class MyVehiculesStrings {
  const MyVehiculesStrings._();

  static String get title => 'myVehicules.title'.tr();
  static String get addNewVehicle => 'myVehicules.addNewVehicle'.tr();
  static String get color => 'myVehicules.color'.tr();
  static String get co2Emission => 'myVehicules.co2Emission'.tr();
  static String get principalVehicle => 'myVehicules.principalVehicle'.tr();
  static String get setAsPrincipal => 'myVehicules.setAsPrincipal'.tr();
  static String get edit => 'myVehicules.edit'.tr();
  static String get delete => 'myVehicules.delete'.tr();
  static String get deleteCarDialogTitle =>
      'myVehicules.deleteCarDialogTitle'.tr();
  static String get deleteCarDialogDescription =>
      'myVehicules.deleteCarDialogDescription'.tr();
  static String get deleteCarDialogMainButton =>
      'myVehicules.deleteCarDialogMainButton'.tr();
  static String get deleteCarDialogSecondaryButton =>
      'myVehicules.deleteCarDialogSecondaryButton'.tr();
  static String get carDeletedSuccessfully =>
      'myVehicules.carDeletedSuccessfully'.tr();
}

class MyPaymentMethodesStrings {
  const MyPaymentMethodesStrings._();

  static String get title => 'myPaymentMethodes.title'.tr();
  static String get addNewCard => 'myPaymentMethodes.addNewCard'.tr();
  static String get defaultCard => 'myPaymentMethodes.defaultCard'.tr();
  static String get setAsDefault => 'myPaymentMethodes.setAsDefault'.tr();
  static String get edit => 'myPaymentMethodes.edit'.tr();
  static String get delete => 'myPaymentMethodes.delete'.tr();
  static String get deleteCardDialogTitle =>
      'myPaymentMethodes.deleteCardDialogTitle'.tr();
  static String get deleteCardDialogDescription =>
      'myPaymentMethodes.deleteCardDialogDescription'.tr();
  static String get deleteCardDialogMainButton =>
      'myPaymentMethodes.deleteCardDialogMainButton'.tr();
  static String get deleteCardDialogSecondaryButton =>
      'myPaymentMethodes.deleteCardDialogSecondaryButton'.tr();
  static String get cardDeletedSuccessfully =>
      'myPaymentMethodes.cardDeletedSuccessfully'.tr();
  static String get cardSetAsDefaultSuccessfully =>
      'myPaymentMethodes.cardSetAsDefaultSuccessfully'.tr();
  static String get emptyStateTitle => 'myPaymentMethodes.emptyStateTitle'.tr();
  static String get emptyStateDescription =>
      'myPaymentMethodes.emptyStateDescription'.tr();
}

class AddVehiculeStrings {
  const AddVehiculeStrings._();

  static String get title => 'addVehicule.title'.tr();
  static String get description => 'addVehicule.description'.tr();
  static String get saveButton => 'addVehicule.saveButton'.tr();
  static String get vehicleSavedSuccessfully =>
      'addVehicule.vehicleSavedSuccessfully'.tr();
}
