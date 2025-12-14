import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/services/picked_language_service.dart';

class TimezoneInterceptor extends Interceptor {
  final _logger = getLogger('LanguageHeaderInterceptor');
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _logger.i('Intercepting request to ${options.path}');

    String timeZone = "UTC";
    try {
      final timeZoneResult = await FlutterTimezone.getLocalTimezone();

      timeZone = timeZoneResult.identifier;
    } catch (e) {}

    options.headers['Timezone'] = timeZone;
    super.onRequest(options, handler);
  }
}
