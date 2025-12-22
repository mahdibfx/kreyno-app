import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:kreyno/app/app.logger.dart';

class TimezoneInterceptor extends Interceptor {
  final _logger = getLogger('TimezoneInterceptor');

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
      _logger.i('Timezone is  $timeZone');
    } catch (e) {
      _logger.e('Error getting timezone: $e');
    }

    options.headers['Timezone'] = timeZone;
    super.onRequest(
      options,
      handler,
    ); // Use handler.next() instead of super.onRequest()
  }
}
