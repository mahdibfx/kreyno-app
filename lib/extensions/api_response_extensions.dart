import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/ui/common/app_strings.dart';

extension ApiResponseExtensions<T> on Future<ApiResponse<T>> {
  static final _logger = getLogger('ApiResponseExtensions');

  /// Converts ApiResponse<T> to Either<String, T>
  /// Handles both Dio exceptions and API response errors
  Future<Either<String, T>> toEither() async {
    try {
      final response = await this;

      if (response.success) {
        return right(response.data);
      } else {
        _logger.w('API returned error', error: response.message);
        return left(response.message ?? ApiErrorStrings.requestFailed);
      }
    } on DioException catch (dioError) {
      final errorMessage = _handleDioException(dioError);
      return left(errorMessage);
    } catch (error) {
      _logger.e('Unexpected error occurred', error: error);
      return left(ApiErrorStrings.unexpectedError);
    }
  }

  static String _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _logger.w('Connection timeout occurred');
        return ApiErrorStrings.connectionTimeout;

      case DioExceptionType.sendTimeout:
        _logger.w('Send timeout occurred');
        return ApiErrorStrings.requestTimeout;

      case DioExceptionType.receiveTimeout:
        _logger.w('Receive timeout occurred');
        return ApiErrorStrings.serverResponseTimeout;

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        _logger.i('Request was cancelled');
        return ApiErrorStrings.requestCancelled;

      case DioExceptionType.connectionError:
        _logger.w('Connection error occurred', error: error.error);
        return ApiErrorStrings.connectionError;

      case DioExceptionType.badCertificate:
        _logger.e('Bad certificate error', error: error.error);
        return ApiErrorStrings.certificateError;

      case DioExceptionType.unknown:
        _logger.e('Unknown error occurred', error: error.error);
        return ApiErrorStrings.unexpectedError;
    }
  }

  static String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    _logger.w(
      'Bad response received',
      error: 'Status: $statusCode, Data: $responseData',
    );

    // Try to extract error message from response
    String? serverMessage;
    if (responseData is Map<String, dynamic>) {
      serverMessage =
          responseData['message'] as String? ??
          responseData['error'] as String?;
    }

    switch (statusCode) {
      case 400:
        return serverMessage ?? ApiErrorStrings.badRequest;
      case 401:
        return ApiErrorStrings.authenticationFailed;
      case 403:
        return ApiErrorStrings.accessDenied;
      case 404:
        return ApiErrorStrings.resourceNotFound;
      case 409:
        return serverMessage ?? ApiErrorStrings.conflictError;
      case 422:
        return serverMessage ?? ApiErrorStrings.invalidData;
      case 429:
        return ApiErrorStrings.tooManyRequests;
      case 500:
        return ApiErrorStrings.internalServerError;
      case 502:
        return ApiErrorStrings.badGateway;
      case 503:
        return ApiErrorStrings.serviceUnavailable;
      case 504:
        return ApiErrorStrings.gatewayTimeout;
      default:
        return serverMessage ?? ApiErrorStrings.serverError;
    }
  }
}
