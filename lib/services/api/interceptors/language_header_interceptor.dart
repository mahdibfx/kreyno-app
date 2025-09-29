import 'package:dio/dio.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/services/picked_language_service.dart';

class LanguageHeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final languageResult = await locator<PickedLanguageService>()
        .getPickedLanguage();

    final acceptLanguage = languageResult.fold(
      (error) => 'fr', // Fallback to French if error
      (language) {
        if (language == null) {
          return 'fr'; // Default to French if no language selected
        }
        return '$language.code';
      },
    );

    options.headers['Accept-Language'] = acceptLanguage;
    super.onRequest(options, handler);
  }
}
