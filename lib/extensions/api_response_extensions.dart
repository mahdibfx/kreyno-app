import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/paginated_list.dart';
import 'package:kreyno/models/pagination_meta.dart';
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
      rethrow;
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
        return serverMessage ?? ApiErrorStrings.authenticationFailed;
      case 403:
        return serverMessage ?? ApiErrorStrings.accessDenied;
      case 404:
        return serverMessage ?? ApiErrorStrings.resourceNotFound;
      case 409:
        return serverMessage ?? ApiErrorStrings.conflictError;
      case 422:
        return serverMessage ?? ApiErrorStrings.invalidData;
      case 429:
        return serverMessage ?? ApiErrorStrings.tooManyRequests;
      case 500:
        return serverMessage ?? ApiErrorStrings.internalServerError;
      case 502:
        return serverMessage ?? ApiErrorStrings.badGateway;
      case 503:
        return serverMessage ?? ApiErrorStrings.serviceUnavailable;
      case 504:
        return serverMessage ?? ApiErrorStrings.gatewayTimeout;
      default:
        return serverMessage ?? ApiErrorStrings.serverError;
    }
  }

  Future<Either<String, PaginatedList<E>>> toPaginatedEither<E>() async {
    try {
      final response = await this;

      if (response.success) {
        if (response.data is List) {
          return right(
            PaginatedList(
              items: (response.data as List).cast<E>(),
              meta: _parsePaginationMeta(response.meta),
            ),
          );
        } else {
          _logger.e(
            'Expected List data for pagination but got ${response.data.runtimeType}',
          );
          return left(ApiErrorStrings.unexpectedError);
        }
      } else {
        _logger.w('API returned error', error: response.message);
        return left(response.message ?? ApiErrorStrings.requestFailed);
      }
    } on DioException catch (dioError) {
      final errorMessage = _handleDioException(dioError);
      return left(errorMessage);
    } catch (error) {
      rethrow;
      _logger.e('Unexpected error occurred', error: error);
      return left(ApiErrorStrings.unexpectedError);
    }
  }

  static PaginationMeta _parsePaginationMeta(Map<String, dynamic>? meta) {
    try {
      if (meta != null && meta.containsKey('pagination')) {
        return PaginationMeta.fromJson(
          meta['pagination'] as Map<String, dynamic>,
        );
      }
    } catch (e) {
      _logger.e('Error parsing pagination meta', error: e);
    }
    return const PaginationMeta(current: 0, totalItems: 0, hasMore: false);
  }
}
