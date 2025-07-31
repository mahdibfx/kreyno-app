import 'package:easy_localization/easy_localization.dart';

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
