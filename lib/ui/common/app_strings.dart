import 'package:easy_localization/easy_localization.dart';

class CommonStrings {
  const CommonStrings._();

  static String get continueLabel => 'common.continue'.tr();
}

class OnboardingStrings {
  const OnboardingStrings._();

  static String get tagLine => 'onboarding.tagLine'.tr();
  static String get buttonLabel => 'onboarding.buttonLabel'.tr();
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
}
