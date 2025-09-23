import 'package:dio/dio.dart';

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
      // FIXME: remove this after implementing auth service
      // final authService = locator<AuthService>();
      // final accessToken = await authService.getAccessToken();
      final accessToken = 'access_token';
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
