import 'package:dio/dio.dart';
import 'package:kreyno/app/app.logger.dart';
import '../api_endpoints.dart';

class SessionExpiredInterceptor extends Interceptor {
  final _logger = getLogger('SessionExpiredInterceptor');

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Check if the response has a 401 status code (Unauthorized)
    if (response.statusCode == 401 &&
        !_shouldExcludeRoute(response.requestOptions.path)) {
      _handleSessionExpired();
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Also check for 401 errors in case they come through as errors
    if (err.response?.statusCode == 401 &&
        !_shouldExcludeRoute(err.requestOptions.path)) {
      _handleSessionExpired();
    }

    super.onError(err, handler);
  }

  bool _shouldExcludeRoute(String path) {
    const excludedEndpoints = [
      ApiEndpoints.signIn,
      ApiEndpoints.register,
      ApiEndpoints.exists,
      ApiEndpoints.sendOtp,
    ];

    return excludedEndpoints.any((endpoint) => path.contains(endpoint));
  }

  void _handleSessionExpired() {
    // TODO: Implement user logout functionality
    // This should:
    // 1. Clear stored authentication tokens
    // 2. Clear user session data
    // 3. Navigate to login screen
    // 4. Show appropriate message to user
    _logger.i('Session expired - User should be logged out');
  }
}
