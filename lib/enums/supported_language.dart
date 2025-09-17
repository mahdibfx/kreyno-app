enum SupportedLanguage {
  fr(code: 'fr', countryCode: 'FR'),
  en(code: 'en', countryCode: 'US');

  const SupportedLanguage({required this.code, required this.countryCode});

  final String code;
  final String countryCode;
}
