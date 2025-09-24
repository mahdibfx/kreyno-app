import 'package:dio/dio.dart';

class LanguageHeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: Get language from user prefs
    options.headers['Accept-Language'] = 'fr-FR';
    super.onRequest(options, handler);
  }
}
