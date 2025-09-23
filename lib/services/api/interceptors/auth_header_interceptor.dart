import 'package:dio/dio.dart';

import '../../../app/app.locator.dart';
import '../../auth_service.dart';
import '../api_endpoints.dart';

class AuthHeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const excludedEndpoints = [
      ApiEndpoints.signIn,
      ApiEndpoints.register,
      ApiEndpoints.exists,
      ApiEndpoints.sendOtp,
    ];

    bool shouldExclude = excludedEndpoints.any(
      (endpoint) => options.path.contains(endpoint),
    );

    if (!shouldExclude) {
      final accessToken = await locator<AuthService>().getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }
    super.onRequest(options, handler);
  }
}
