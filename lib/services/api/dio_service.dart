import 'package:dio/dio.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:kreyno/services/api/interceptors/auth_header_interceptor.dart';
import 'package:kreyno/services/api/interceptors/language_header_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  final _logger = getLogger('DioService');
  final Dio dio;

  DioService()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiEndpoints.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {'content-Type': 'application/json'},
          ),
        ) {
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        maxWidth: 1000,
        logPrint: (object) => _logger.v(object.toString()),
      ),
    );
    dio.interceptors.add(LanguageHeaderInterceptor());
    dio.interceptors.add(AuthHeaderInterceptor());
  }
}
